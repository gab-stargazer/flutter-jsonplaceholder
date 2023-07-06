import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/model/post_dto.dart';

abstract class JsonPlaceHolderRepository {

  Future<List<PostDto>> getPost();

  Future<List<CommentDto>> getCommentsByPostId(int postId);
}
