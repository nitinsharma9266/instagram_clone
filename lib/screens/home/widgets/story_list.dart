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
      'Simran',
      'Varun',
      'Kavya',
      'Mohit',
      'Nisha',
      'Akash',
      'Meera',
      'Rajat',
      'Shreya',
      'Abhishek',
      'Muskan',
      'Vivek',
      'Isha',
      'Sahil',
      'Tanya',
      'Yash',
      'Aarti',
      'Nikhil',
      'Sakshi',
      'Harsh',
      'Komal',
      'Manish',
      'Divya',
      'Gaurav',
      'Payal',
      'Ayush',
      'Ritu',
      'Deepak',
      'Swati',
      'Ankit',
      'Preeti',
      'Saurabh',
      'Nandini',
      'Ravi',
      'Kriti',
      'Manav',
      'Pallavi',

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
