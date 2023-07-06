import 'package:json_placeholder_album/data/model/comment_dto.dart';
import 'package:json_placeholder_album/data/model/post_dto.dart';
import 'package:json_placeholder_album/domain/model/comment.dart';

import '../model/post.dart';

extension ToPost on PostDto {
  Post toPost() => Post(userId: userId, id: id, title: title, body: body);
}

extension ToComment on CommentDto {
  Comment toComment() => Comment(postId: postId, id: id, name: name, email: email, body: body);
}