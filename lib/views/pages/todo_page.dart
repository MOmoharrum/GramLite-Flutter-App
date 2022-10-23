import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_data_operation/controllers/post_controller.dart';
import 'package:flutter_data_operation/controllers/todo_controller.dart';
import 'package:flutter_data_operation/models/todo.dart';
import 'package:flutter_data_operation/services/app_config_service.dart';

class TodoPage extends StatefulWidget {
  final int? index;
  const TodoPage({Key? key, required this.index}) : super(key: key);

  @override
  State<TodoPage> createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  late TodoController _todoController;
  late PostController _postController;

  @override
  void initState() {
    _todoController = TodoController(this);
    _todoController.getTodoHandler();

    _postController = PostController(this);
    _postController.getPostsHandler();
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose();
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: _todoController.todoList == null
          ? Center(child: CircularProgressIndicator())
          : _todoController.todoList?.isEmpty ?? false
              ? Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  itemCount: _todoController.todoList?.length,
                  itemBuilder: ((context, index) {
                    if (_todoController.todoList?[index].userId ==
                        AppConfigService.appUser?.id) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            shape: Border(
                                left: BorderSide(
                                    color: Colors.purple.withOpacity(.4),
                                    width: 10)),
                            child: ListTile(
                                title: Text(
                                  _todoController.todoList?[index].title ??
                                      'No Title',
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.purple),
                                ),

                                // subtitle: Padding(
                                //   padding: const EdgeInsets.symmetric(vertical: 5),
                                //   child: Text(
                                //     _todoController.todoList[index].completed ?? ,
                                //     maxLines: 2,
                                //   ),
                                // ),

                                trailing: Checkbox(
                                    value: _todoController
                                        .todoList?[index].completed,
                                    onChanged: (value) {
                                      setState(() => _todoController
                                          .todoList?[index].completed = value!);
                                    })),
                          ),
                        ),
                      );
                    } else {
                      print('');
                      return Padding(padding: EdgeInsets.all(1));
                    }
                  }),
                ),
    );
  }
}
