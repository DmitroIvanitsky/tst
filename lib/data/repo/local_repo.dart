import 'package:shared_preferences/shared_preferences.dart';

const String keyLogs = 'LOGS';


class LocalRepo {
  Future<List<String>?> _getList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<bool> _saveList(List<String> list, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, list);
  }

  Future<List<String>?> getLogs() async {
    return _getList(keyLogs);
  }


  Future<bool> saveLog(String log) async {
    List<String> currentList = (await _getList(keyLogs)) ?? [];
    currentList.add(log);
    return _saveList(currentList, keyLogs);
  }
}
