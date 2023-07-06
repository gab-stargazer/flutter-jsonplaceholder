import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';
import 'package:json_placeholder_album/domain/mapper/mapper.dart';
import 'package:json_placeholder_album/domain/model/comment.dart';
import 'package:json_placeholder_album/domain/usecases/comment_usecases.dart';

class CommentUseCasesImpl implements CommentUseCases {
  final JsonPlaceHolderRepository repository;

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final List<CommentDto> commentsDto = await repository.getCommentsByPostId(postId);
    final List<Comment> comments = [];
    for (final commentDto in commentsDto) {
      final Comment comment = commentDto.toComment();
      comments.add(comment);
    }
    return comments;
  }

  const CommentUseCasesImpl({required this.repository});
}
