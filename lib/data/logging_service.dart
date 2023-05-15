import 'repo/local_repo.dart';

class LoggingService {
  LoggingService(this._localRepo, {required this.isLoggingEnabled});
  final LocalRepo _localRepo;
  late bool isLoggingEnabled;

  Future<bool> saveLogs(String log){
    if (isLoggingEnabled) {
      return _localRepo.saveLog(log);
    } else {
      return Future.value(true);
    }
  }

}