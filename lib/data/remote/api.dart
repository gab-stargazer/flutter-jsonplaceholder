import 'package:dio/dio.dart';
import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/model/post_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('posts')
  Future<List<PostDto>> getPost();

  @GET('posts/{id}/comments')
  Future<List<CommentDto>> getCommentsByPostId(@Path('id') int id);
}
