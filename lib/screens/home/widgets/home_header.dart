import 'package:flutter/material.dart';

class homeHeader extends StatelessWidget{
  const homeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Text(
              'Instagram',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const Spacer(),

            IconButton(
              onPressed: () {
                print("Added Box");
              },
              icon: const Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () {
                print("Favorite");
              },
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
    );
  }
}