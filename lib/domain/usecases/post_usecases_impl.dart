import 'package:json_placeholder_album/data/model/post_dto.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';
import 'package:json_placeholder_album/domain/mapper/mapper.dart';
import 'package:json_placeholder_album/domain/model/post.dart';
import 'package:json_placeholder_album/domain/usecases/post_usecases.dart';

class PostUseCasesImpl implements PostUseCases {
  final JsonPlaceHolderRepository repository;

  @override
  Future<List<Post>> getPost() async {
    final List<PostDto> postsDTO = await repository.getPost();
    final List<Post> posts = [];
    for (final postDto in postsDTO) {
      final Post post = postDto.toPost();
      posts.add(post);
    }
    return posts;
  }

  const PostUseCasesImpl({required this.repository});
}
