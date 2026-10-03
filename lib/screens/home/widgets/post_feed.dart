import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home/widgets/post_card.dart';


class PostFeed extends StatelessWidget{
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Rahul',
      'Priya',
      'Aman',
      'Anjali',
      'Rohit',
      'Neha',
      'Arjun',
      'Sneha',
      'Karan',
      'Pooja',
      'Vikas',
      'Riya',
      'Aditya',
      'Simran',
      'Varun',
      'Kavya',
      'Mohit',
      'Nisha',
      'Akash',
      'Meera',
    ];
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
          name: names[index],
        );
      },
    );
  }
}
