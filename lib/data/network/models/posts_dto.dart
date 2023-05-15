import 'dart:convert';

import '../../../domain/models/post.dart';

class PostsDto {
  final List<Post> posts;

  PostsDto({
    required this.posts,
  });

  factory PostsDto.fromRawJson(String str) => PostsDto.fromJson(json.decode(str) as List);

  factory PostsDto.fromJson(List json) => PostsDto(
    posts: json.map((i) => Post.fromJson(i)).toList()
  );
}