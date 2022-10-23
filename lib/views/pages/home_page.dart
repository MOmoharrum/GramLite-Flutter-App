import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_data_operation/controllers/post_controller.dart';
import 'package:flutter_data_operation/controllers/todo_controller.dart';
import 'package:flutter_data_operation/main.dart';
import 'package:flutter_data_operation/models/post.dart';
import 'package:flutter_data_operation/services/app_config_service.dart';
import 'package:flutter_data_operation/services/post_service.dart';
import 'package:flutter_data_operation/views/pages/post_details.dart';
import 'package:flutter_data_operation/views/pages/splash_page.dart';
import 'package:flutter_data_operation/views/pages/todo_page.dart';
import 'package:flutter_data_operation/views/widgets/post_widget.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostController _postController;
  // late TodoController _todoController;

  @override
  void initState() {
    _postController = PostController(this);
    _postController.getPostsHandler();

    // _todoController = TodoController(this);
    // _todoController.getTodoHandler();
    super.initState();
  }

  @override
  void dispose() {
    _postController.dispose();
    // _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(AppConfigService.appUser?.name ?? 'No name'),
              accountEmail: Text(AppConfigService.appUser?.email ?? 'No email'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    AppConfigService.appUser!.name![0],
                    style: TextStyle(color: Colors.purple, fontSize: 25),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                var result = (await showFutureLoadingDialog(
                        context: context, future: () => prefs!.clear()))
                    .result;
                if (result ?? false) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => SplashPage()),
                      (route) => false);
                } else {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsAlignment: MainAxisAlignment.center,
                          title: Text('Error when Logging out!!!'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Try Again'))
                          ],
                        );
                      });
                }
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('Todo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoPage(
                              index: AppConfigService.appUser?.id,
                            )));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Gram Lite'),
      ),
      body: _postController.postsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _postController.postsList?.isEmpty ?? false
              ? const Center(
                  child: Text('No Data'),
                )
              : ListView.builder(
                  itemCount: _postController.postsList?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: PostWidget(
                        post: _postController.postsList![index],
                        onCommentClicked: () {
                          print(index);
                        },
                        onPostClicked: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PostDetails(
                                      post:
                                          _postController.postsList![index])));
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
/* */