// import 'package:flutter/material.dart';
//
// class PostCard extends StatelessWidget {
//   final String name;
//   const PostCard({super.key, required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 8,
//       ),
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: const BorderSide(
//           color: Colors.black26,
//           width: 0.5,
//         ),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8,
//               vertical: 4,
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(3),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.purple,
//                         Colors.pink,
//                         Colors.orange,
//                       ],
//                       begin: Alignment.bottomLeft,
//                       end: Alignment.topRight,
//                     ),
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(3),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: const CircleAvatar(
//                       radius: 20,
//                       backgroundColor: Colors.grey,
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width: 12),
//
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//
//                 const Spacer(),
//
//                 IconButton(
//                   onPressed: () {
//                     print('More button clicked');
//                   },
//                   icon: const Icon(Icons.more_horiz),
//                 ),
//               ],
//             ),
//           ),
//
//           const Divider(
//             thickness: 1,
//             color: Colors.black26,
//             height: 1,
//           ),
//
//           const SizedBox(
//             height: 300,
//           ),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   print('Like button clicked');
//                 },
//                 icon: const Icon(Icons.favorite_border),
//               ),
//               const SizedBox(width: 8),
//               IconButton(
//                 onPressed: () {
//                   print('Comment button clicked');
//                 },
//                 icon: const Icon(Icons.comment_outlined),
//               ),
//               const SizedBox(width: 8),
//               IconButton(
//                 onPressed: () {
//                   print('Share button clicked');
//                 },
//                 icon: const Icon(Icons.send),
//               ),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   print('Save button clicked');
//                 },
//                 icon: const Icon(Icons.bookmark_border),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../models/post_model.dart';

class PostCard extends StatelessWidget {

  final PostModel post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black26,
          width: 0.5,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Profile Header
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
              NetworkImage(post.profileImage),
            ),
            title: Text(
              post.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.more_horiz),
          ),

          // Post Image
          Image.network(
            post.postImage,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;

              return const SizedBox(
                height: 350,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 350,
                child: Center(
                  child: Icon(Icons.broken_image),
                ),
              );
            },
          ),

          // Action Buttons
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Text(
              '${post.likes} likes',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '${post.username} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: post.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}