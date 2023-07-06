import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@Freezed()
class Post with _$Post{
  factory Post({int? userId, int? id, String? title, String? body}) = _Post;
}