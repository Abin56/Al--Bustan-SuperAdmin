import 'package:canteen_superadmin_website/model/admin_model.dart';
import 'package:canteen_superadmin_website/view/login/login_section/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String userRoleKey = 'userRole';
  static late SharedPreferences _prefs;

  static Future<void> clearSharedPreferenceData() async {
    await setString(userRoleKey, "");
  }

  static Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    final result = await _prefs.setString(key, value);
    return result;
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static Future<bool> setInt(String key, int value) async {
    final result = await _prefs.setInt(key, value);

    return result;
  }

  // Add more functions as needed
}

class UserCredentialsController {
  static String? userRole;
  static AdminModel? userModel;

  static void clearUserCredentials() {
    userModel = null;
  }
}

logoutUser() async {
  await FirebaseAuth.instance.signOut().then((value) async {
    Get.offAll(const LoginSection());
    await SharedPreferencesHelper.clearSharedPreferenceData();
    UserCredentialsController.clearUserCredentials();
  });
}
