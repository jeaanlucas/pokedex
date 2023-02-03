import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataRepository extends Disposable {
  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();

  Future<bool> insertOrUpdate(key, value) async {
    try {
      SharedPreferences prefs = await sharedPreferences;

      if (value is String) {
        return await prefs.setString(key, value);
      } else if (value is double) {
        return await prefs.setDouble(key, value);
      } else if (value is bool) {
        return await prefs.setBool(key, value);
      } else if (value is int) {
        return await prefs.setInt(key, value);
      } else if (value is List<String>) {
        return await prefs.setStringList(key, value);
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> read(key) async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      return prefs.get(key);
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {}
}
