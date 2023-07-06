import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/model/post_dto.dart';
import 'package:json_placeholder_album/data/remote/api.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';

class JsonPlaceholderRepositoryImpl implements JsonPlaceHolderRepository {
  final ApiService apiService;

  @override
  Future<List<PostDto>> getPost() => apiService.getPost();

  @override
  Future<List<CommentDto>> getCommentsByPostId(int postId) => apiService.getCommentsByPostId(postId);

  const JsonPlaceholderRepositoryImpl({required this.apiService});
}
