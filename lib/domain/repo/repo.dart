import '../models/post.dart';
import '../models/user.dart';

abstract class Repo{
  Future<List<User>> fetchUsers();
  Future<List<Post>> fetchPosts();
  Future<List<String>?> getLogs();
}
