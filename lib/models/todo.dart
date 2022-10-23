class Todo {
  num? userId;
  num? id;
  String? title;
  bool? completed;

  Todo();

  Todo.fromJson(Map<String, dynamic> data) {
    userId = data['userId'];
    id = data['id'];
    title = data['title'];
    completed = data['completed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
