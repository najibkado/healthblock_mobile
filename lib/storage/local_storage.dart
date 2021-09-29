import 'package:healthblock/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> storeUser(Staff user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', user.userId);
    prefs.setString('token', user.token);
    prefs.setBool('isLoggedIn', true);
    prefs.setString('username', user.user.username);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') != null ? prefs.getInt('userId') : null;
    if (userId != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  static clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<int> getStaffId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');
    return id;
  }
}
