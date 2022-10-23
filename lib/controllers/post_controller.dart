import 'package:flutter_data_operation/models/comment.dart';
import 'package:flutter_data_operation/models/post.dart';
import 'package:flutter_data_operation/services/post_service.dart';
import 'package:states_controller/states_controller.dart';

class PostController extends StatesController {
  List<Post>? postsList;
  List<Comment>? commentsList;

  PostController(super.state);

  void getPostsHandler() async {
    postsList = await PostServices.getPosts();

    setState();
  }

  void getCommentsHandler(num postId) async {
    commentsList = await PostServices.getCommentsByPostId(postId);

    setState();
  }
}
