import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_data_operation/controllers/post_controller.dart';
import 'package:flutter_data_operation/models/post.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  const PostDetails({required this.post, Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  late PostController _postController;

  @override
  void initState() {
    _postController = PostController(this);
    _postController.getCommentsHandler(widget.post.id ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostId : ${widget.post.id}'),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Title:  ',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    TextSpan(
                      text: widget.post.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    )
                  ])),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'body:  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: widget.post.body,
                      style: TextStyle(color: Colors.black),
                    )
                  ])),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'userId : ${widget.post.userId}',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: _postController.commentsList == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _postController.commentsList?.isEmpty ?? false
                      ? const Center(
                          child: Text('No Data'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _postController.commentsList?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                title: Text(
                                    _postController.commentsList?[index].body ??
                                        ''),
                                subtitle: Text(_postController
                                        .commentsList?[index].email ??
                                    ''),
                              ),
                            );
                          }))
        ],
      ),
    );
  }
}
