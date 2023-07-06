import 'package:json_placeholder_album/domain/model/post.dart';

abstract class PostUseCases {

  Future<List<Post>> getPost();
}