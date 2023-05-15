import 'package:http/http.dart' as http;
import 'package:test_project/data/logging_service.dart';

import 'package:test_project/data/network/api_client.dart';
import 'package:test_project/data/network/models/posts_dto.dart';
import 'package:test_project/data/network/models/users_dto.dart';

import '../../domain/models/post.dart';
import '../../domain/models/user.dart';
import 'endpoints.dart';

class ApiClientImpl implements ApiClient {
  ApiClientImpl({required this.loggingService});

  @override
  LoggingService loggingService;

  Future<http.Response> get(String endpoint) async {
    http.Response response =  await http.get(Uri.parse(endpoint));
    loggingService.saveLogs(response.toString());
    return response;
  }

  Future<List<User>> fetchUsers() async {
    final response = await get(Endpoints.users);
    return UsersDto.fromRawJson(response.body).users;
  }

  Future<List<Post>> fetchPost() async {
    final response = await get(Endpoints.posts);
    return PostsDto.fromRawJson(response.body).posts;
  }


}