import '../../../domain/models/post.dart';
import '../../../domain/models/user.dart';
import '../../../domain/repo/repo.dart';
import 'local_repo.dart';
import 'network_repo.dart';


class RepoImpl implements Repo {
  final NetworkRepo _networkRepo;
  final LocalRepo _localRepo;

  RepoImpl(this._networkRepo, this._localRepo);

  @override
  Future<List<Post>> fetchPosts() async {
    return _networkRepo.fetchPosts();
  }

  @override
  Future<List<User>> fetchUsers() async {
    return _networkRepo.fetchUsers();
  }

  @override
  Future<List<String>?> getLogs() async {
    return _localRepo.getLogs();
  }
}
