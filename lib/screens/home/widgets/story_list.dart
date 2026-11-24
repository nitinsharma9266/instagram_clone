// import 'package:flutter/material.dart';
//
// import 'story_item.dart';
//
// class StoryList extends StatelessWidget {
//   const StoryList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final List<String> names = [
//       'Your Story',
//       'Rahul',
//       'Priya',
//       'Aman',
//       'Anjali',
//       'Rohit',
//       'Neha',
//       'Arjun',
//       'Sneha',
//       'Karan',
//       'Simran',
//       'Varun',
//       'Kavya',
//       'Mohit',
//       'Nisha',
//       'Akash',
//       'Meera',
//       'Rajat',
//       'Shreya',
//       'Abhishek',
//       'Muskan',
//       'Vivek',
//       'Isha',
//       'Sahil',
//       'Tanya',
//       'Yash',
//       'Aarti',
//       'Nikhil',
//       'Sakshi',
//       'Harsh',
//       'Komal',
//       'Manish',
//       'Divya',
//       'Gaurav',
//       'Payal',
//       'Ayush',
//       'Ritu',
//       'Deepak',
//       'Swati',
//       'Ankit',
//       'Preeti',
//       'Saurabh',
//       'Nandini',
//       'Ravi',
//       'Kriti',
//       'Manav',
//       'Pallavi',
//
//     ];
//     return SizedBox(
//       height: 110,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: names.length,
//         itemBuilder: (BuildContext context, int index) {
//           return StoryItem(name: names[index]);
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../models/story_model.dart';
import '../../../services/api_service.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {

  final ApiService apiService = ApiService();

  late Future<List<StoryModel>> storiesFuture;

  @override
  void initState() {
    super.initState();
    storiesFuture = apiService.fetchStories();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 105,
      child: FutureBuilder<List<StoryModel>>(
        future: storiesFuture,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Stories unavailable'),
            );
          }

          final stories = snapshot.data ?? [];

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,

            itemBuilder: (context, index) {

              final story = stories[index];

              return GestureDetector(
                onTap: () {

                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.black,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              story.storyImage,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              story.username,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),

                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.pink,
                              Colors.orange,
                            ],
                          ),
                        ),

                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage:
                            NetworkImage(story.profileImage),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      SizedBox(
                        width: 65,
                        child: Text(
                          story.username,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}