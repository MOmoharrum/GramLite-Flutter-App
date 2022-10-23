import 'dart:convert';

import 'package:flutter_data_operation/models/comment.dart';
import 'package:flutter_data_operation/models/post.dart';
import 'package:http/http.dart' as http;

class PostServices {
  static Future<List<Post>?> getPosts() async {
    List<Post>? postList;
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        var mapList = jsonDecode(response.body) as List;
        postList = mapList.map((e) => Post.fromJson(e)).toList();
        return postList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Comment>?> getCommentsByPostId(num postId) async {
    List<Comment>? commentList;
    try {
      var response = await http
          .get(Uri.parse(
              'https://jsonplaceholder.typicode.com/comments?postId=${postId}'))
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        var mapList = jsonDecode(response.body) as List;
        commentList = mapList.map((e) => Comment.fromJson(e)).toList();
        return commentList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
