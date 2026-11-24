// import 'package:flutter/material.dart';
// import 'package:instagram_clone/screens/home/widgets/post_card.dart';
//
//
// class PostFeed extends StatelessWidget{
//   const PostFeed({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> names = [
//       'Rahul',
//       'Priya',
//       'Aman',
//       'Anjali',
//       'Rohit',
//       'Neha',
//       'Arjun',
//       'Sneha',
//       'Karan',
//       'Pooja',
//       'Vikas',
//       'Riya',
//       'Aditya',
//       'Simran',
//       'Varun',
//       'Kavya',
//       'Mohit',
//       'Nisha',
//       'Akash',
//       'Meera',
//     ];
//     return ListView.builder(
//       itemCount: names.length,
//       itemBuilder: (BuildContext context, int index) {
//         return PostCard(
//           name: names[index],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../models/post_model.dart';
import '../../../services/api_service.dart';
import 'post_card.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({super.key});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {

  final ApiService apiService = ApiService();

  final ScrollController scrollController =
  ScrollController();

  List<PostModel> posts = [];

  int currentPage = 1;
  final int limit = 20;

  bool isLoading = false;
  bool hasMore = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    loadPosts();

    scrollController.addListener(() {

      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 300 &&
          !isLoading &&
          hasMore) {

        loadPosts();
      }
    });
  }

  Future<void> loadPosts() async {

    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {

      final newPosts = await apiService.fetchPosts(
        page: currentPage,
        limit: limit,
      );

      if (!mounted) return;

      setState(() {
        posts.addAll(newPosts);
        currentPage++;

        hasMore = newPosts.length == limit;
        isLoading = false;
      });

    } catch (e) {

      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = 'Unable to load posts';
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (posts.isEmpty && isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (posts.isEmpty && errorMessage != null) {
      return Center(
        child: TextButton(
          onPressed: loadPosts,
          child: const Text('Retry'),
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,

      itemCount: posts.length +
          ((hasMore || errorMessage != null) ? 1 : 0),

      itemBuilder: (context, index) {

        if (index == posts.length) {

          if (errorMessage != null) {
            return TextButton(
              onPressed: loadPosts,
              child: const Text('Retry loading posts'),
            );
          }

          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return PostCard(
          post: posts[index],
        );
      },
    );
  }
}
