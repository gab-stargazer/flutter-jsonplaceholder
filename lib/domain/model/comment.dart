import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@Freezed()
class Comment with _$Comment {
  factory Comment({int? postId, int? id, String? name, String? email, String? body}) = _Comment;
}