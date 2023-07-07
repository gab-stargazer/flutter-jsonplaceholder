import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/repository/json_placeholder_repository.dart';
import 'package:json_placeholder_album/domain/mapper/mapper.dart';
import 'package:json_placeholder_album/domain/model/comment.dart';
import 'package:json_placeholder_album/domain/usecases/comment_usecases.dart';
import 'package:logger/logger.dart';

class CommentUseCasesImpl implements CommentUseCases {
  const CommentUseCasesImpl({required this.repository, required this.logger});

  final JsonPlaceHolderRepository repository;
  final Logger logger;

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final List<CommentDto> commentsDto =
        await repository.getCommentsByPostId(postId).then((value) {
      logger.i(value);
      return value;
    });
    final List<Comment> comments = [];
    for (final commentDto in commentsDto) {
      final Comment comment = commentDto.toComment();
      comments.add(comment);
    }
    return comments;
  }
}
