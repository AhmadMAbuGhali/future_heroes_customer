import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferenceHelper {
  static const String token = "token";
  static const String isActive = "isActive";
  static const String isLogin = 'isLogin';
  final SharedPreferences prefs;
  SharedPreferenceHelper({required this.prefs});
  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
  }
  Future<void> setActiveStat({required bool activeStat}) async {
    await prefs.setBool(isActive, activeStat);
  }
  String? getUserToken() {
    final userToken = prefs.getString(token);
    return userToken;
  }
  bool? getActiveStat() {
    final isActiveStat = prefs.getBool(isActive);
    return isActiveStat;
  }

  Future<void> setIsLogin({required bool isLogint}) async {
    await prefs.setBool(isLogin, isLogint);
  }
  bool? getIsLogin() {
    final userLogin = prefs.getBool(isLogin);
    return userLogin;
  }
}