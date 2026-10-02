import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/story_list.dart';
import 'widgets/post_feed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              homeHeader(),
              StoryList(),
              SizedBox(height: 16),
              Divider(
                thickness: 1,
                color: Colors.black26,
              ),
              Expanded(child: PostFeed()),
            ],
          ),
        ),
    );
  }
}