import 'package:pet_adoption_app/pet_data_tile_new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  static String anushkaData = "";
  List<String> adoptedPetRef = [];

  static Future<bool> saveAnushkaData(String isUserLoggedInStatus) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(anushkaData, "isUserLoggedInStatus");
  }

  //  static Future<bool> saveAaa(List<bool> token) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setBool(adoptedPetRef, tokenn);
  // }

  // static Future<bool> saveAaa(List<String> tokenn) async {
  //   SharedPreferences sf = await SharedPreferences.getInstance();
  //   return await sf.setStringList(adoptedPetRef, tokenn);
  // }

  static Future<String?> getUserLoogedInStatusFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(anushkaData);
  }
}
