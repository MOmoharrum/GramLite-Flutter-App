import 'package:flutter_data_operation/models/todo.dart';
import 'package:flutter_data_operation/services/todo_service.dart';
import 'package:states_controller/states_controller.dart';

class TodoController extends StatesController {
  List<Todo>? todoList;

  TodoController(super.state);

  void getTodoHandler() async {
    todoList = await TodoService.getTodo();
    setState();
  }
}
