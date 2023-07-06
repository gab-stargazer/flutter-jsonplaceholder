import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {

  @JsonKey(name: 'postId')
  final int postId;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'body')
  final String body;

  const CommentDto({required this.postId, required this.id, required this.name, required this.email, required this.body});

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);
  Map<String, dynamic> toJson()=> _$CommentDtoToJson(this);
}