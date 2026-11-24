class StoryModel {
  final int id;
  final String username;
  final String profileImage;
  final String storyImage;

  StoryModel({
    required this.id,
    required this.username,
    required this.profileImage,
    required this.storyImage,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;

    return StoryModel(
      id: id,
      username: json['username'] ?? 'User',
      profileImage: json['image'] ?? '',
      storyImage: 'https://picsum.photos/seed/story$id/600/900',
    );
  }
}
