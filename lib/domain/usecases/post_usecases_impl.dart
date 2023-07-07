import 'package:json_placeholder_album/data/model/post_dto.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';
import 'package:json_placeholder_album/domain/mapper/mapper.dart';
import 'package:json_placeholder_album/domain/model/post.dart';
import 'package:json_placeholder_album/domain/usecases/post_usecases.dart';
import 'package:logger/logger.dart';

class PostUseCasesImpl implements PostUseCases {
  const PostUseCasesImpl({required this.repository, required this.logger});

  final JsonPlaceHolderRepository repository;
  final Logger logger;

  @override
  Future<List<Post>> getPost() async {
    final List<PostDto> postsDTO = await repository.getPost().then((value) {
      logger.i(value);
      return value;
    });
    final List<Post> posts = [];
    for (final postDto in postsDTO) {
      final Post post = postDto.toPost();
      posts.add(post);
    }
    return posts;
  }
}
