import 'dart:convert';

import 'package:flutter_data_operation/models/comment.dart';
import 'package:flutter_data_operation/models/post.dart';
import 'package:flutter_data_operation/models/user.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<List<User>?> getUsers() async {
    List<User>? userList;
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(Duration(seconds: 3));
      if (response.statusCode == 200) {
        var mapList = jsonDecode(response.body) as List;
        userList = mapList.map((e) => User.fromJson(e)).toList();
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
