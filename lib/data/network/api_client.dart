import '../../domain/models/user.dart';
import '../../domain/models/post.dart';
import '../logging_service.dart';

abstract class ApiClient {
  ApiClient({required this.loggingService});
  LoggingService loggingService;

  Future<List<User>> fetchUsers();
  Future<List<Post>> fetchPost();
}
