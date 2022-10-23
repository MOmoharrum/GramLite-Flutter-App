class Comment {
  num? postId;
  num? id;
  String? body;
  String? name;
  String? email;

  Comment();

  Comment.fromJson(Map<String, dynamic> data) {
    postId = data['postId'];
    id = data['id'];
    body = data['body'];
    name = data['name'];
    email = data['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'body': body,
      'name': name,
      'email': email,
    };
  }
}
