import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_data_operation/models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final void Function()? onCommentClicked;
  final void Function()? onPostClicked;
  const PostWidget(
      {required this.post,
      required this.onCommentClicked,
      required this.onPostClicked,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: Border(
            left: BorderSide(color: Colors.purple.withOpacity(.4), width: 10)),
        child: ListTile(
          onTap: onPostClicked,
          title: Text(
            post.title ?? 'No Title',
            maxLines: 1,
            style: TextStyle(color: Colors.purple),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              post.body ?? 'No Body',
              maxLines: 2,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.comment),
            onPressed: onCommentClicked,
          ),
        ),
      ),
    );
  }
}
