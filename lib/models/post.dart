class Post {
  num? userId;
  num? id;
  String? title;
  String? body;

  Post();

  Post.fromJson(Map<String, dynamic> data) {
    userId = data['userId'];
    id = data['id'];
    title = data['title'];
    body = data['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
