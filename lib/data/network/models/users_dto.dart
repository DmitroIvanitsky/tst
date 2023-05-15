import 'dart:convert';

import '../../../domain/models/user.dart';

class UsersDto {
  final List<User> users;

  UsersDto({
    required this.users,
  });

  factory UsersDto.fromRawJson(String str) => UsersDto.fromJson(json.decode(str) as List);

  factory UsersDto.fromJson(List json) => UsersDto(
      users: json.map((i) => User.fromJson(i)).toList()
  );
}