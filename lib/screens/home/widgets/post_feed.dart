import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home/widgets/post_card.dart';


class PostFeed extends StatelessWidget{
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return const PostCard();
      },
    );
  }
}
