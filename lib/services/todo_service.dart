import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_data_operation/models/todo.dart';

import 'package:http/http.dart' as http;

class TodoService {
  static Future<List<Todo>?> getTodo() async {
    List<Todo>? todoList;
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'))
          .timeout(Duration(seconds: 3));
      if (response.statusCode == 200) {
        var mapList = jsonDecode(response.body)
            as List; // as List is casting and after deconding it is a list of map
        todoList = mapList.map((e) => Todo.fromJson(e)).toList();
        return todoList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
