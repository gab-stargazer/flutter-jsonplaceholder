import 'package:json_placeholder_album/domain/model/comment.dart';

abstract class CommentUseCases {
  Future<List<Comment>> getCommentsByPostId(int postId);
}