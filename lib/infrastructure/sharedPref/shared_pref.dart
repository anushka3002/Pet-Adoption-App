import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferences {
  static String anushkaData = "";
  static Future<bool> saveAnushkaData(bool isUserLoggedInStatus) async {

    SharedPreferences sf = await SharedPreferences.getInstance()
    return await sf.setBool(anushkaData, isUserLoggedInStatus);
  }

  static Future<bool?> getUserLoogedInStatusFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(isUserLoggedIn);
  }
}
