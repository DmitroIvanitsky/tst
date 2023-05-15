import '../../domain/models/post.dart';
import '../../domain/models/user.dart';
import '../network/api_client.dart';

class NetworkRepo {
  final ApiClient _apiClient;

  NetworkRepo(this._apiClient);

  Future<List<User>> fetchUsers() async {
    return _apiClient.fetchUsers();
  }

  Future<List<Post>> fetchPosts() async {
    return _apiClient.fetchPost();
  }
}
