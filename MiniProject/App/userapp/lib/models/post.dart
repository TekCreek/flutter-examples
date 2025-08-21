class Post {
  final int postId;
  final String title;
  final String description;

  Post({required this.postId, required this.title, required this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      title: json['title'],
      description: json['description'],
    );
  }
}
