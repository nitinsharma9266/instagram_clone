class PostModel {
  final int id;
  final int userId;
  final String username;
  final String profileImage;
  final String title;
  final String description;
  final String postImage;
  final int likes;

  PostModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.profileImage,
    required this.title,
    required this.description,
    required this.postImage,
    required this.likes,
  });

  factory PostModel.fromJson(
      Map<String, dynamic> json,
      Map<String, dynamic> user,
      ) {
    final id = json['id'] as int;

    return PostModel(
      id: id,
      userId: json['userId'],
      username: user['username'] ?? 'Unknown',
      profileImage: user['image'] ?? '',
      title: json['title'] ?? '',
      description: json['body'] ?? '',
      postImage:
      'https://picsum.photos/seed/post$id/600/600',
      likes: json['reactions']?['likes'] ?? 0,
    );
  }
}