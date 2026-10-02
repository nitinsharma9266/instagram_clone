import 'package:flutter/material.dart';

import 'story_item.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Your Story',
      'Rahul',
      'Priya',
      'Aman',
      'Anjali',
      'Rohit',
      'Neha',
      'Arjun',
      'Sneha',
      'Karan',
    ];
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return StoryItem(name: names[index]);
        },
      ),
    );
  }
}
