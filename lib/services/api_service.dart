import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';
import '../models/story_model.dart';

class ApiService {

  static const String postsUrl =
      'https://dummyjson.com/posts';

  static const String usersUrl =
      'https://dummyjson.com/users';

  // Fetch Posts with Pagination
  Future<List<PostModel>> fetchPosts({
    required int page,
    required int limit,
  }) async {

    final skip = (page - 1) * limit;

    final responses = await Future.wait([
      http.get(
        Uri.parse('$postsUrl?limit=$limit&skip=$skip'),
      ),
      http.get(
        Uri.parse('$usersUrl?limit=0'),
      ),
    ]);

    if (responses[0].statusCode != 200 ||
        responses[1].statusCode != 200) {
      throw Exception('API request failed');
    }

    final postsData =
    jsonDecode(responses[0].body);

    final usersData =
    jsonDecode(responses[1].body);

    final List posts = postsData['posts'];
    final List users = usersData['users'];

    final Map<int, Map<String, dynamic>> userMap = {
      for (var user in users)
        user['id'] as int:
        Map<String, dynamic>.from(user),
    };

    return posts.map<PostModel>((post) {

      final user = userMap[post['userId']];

      if (user == null) {
        throw Exception('User not found');
      }

      return PostModel.fromJson(
        Map<String, dynamic>.from(post),
        user,
      );

    }).toList();
  }

  // Fetch Stories
  Future<List<StoryModel>> fetchStories() async {

    final response = await http.get(
      Uri.parse('$usersUrl?limit=20'),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final List users = data['users'];

      return users.map<StoryModel>((user) {
        return StoryModel.fromJson(
          Map<String, dynamic>.from(user),
        );
      }).toList();

    } else {
      throw Exception('Stories loading failed');
    }
  }
}