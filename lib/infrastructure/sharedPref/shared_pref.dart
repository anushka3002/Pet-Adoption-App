import 'dart:convert';
import 'package:pet_adoption_app/pet_data_tile_new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  static String anushkaData = "";
  // static bool isPetCheck = false;
  // static List<PetDataNewTile> adoptedPetPref = [];
  static Future<bool> saveAdoptedData(List<bool> token) async {
    String jsonString = jsonEncode(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("adoptedPetPref", jsonString);
    print("adsfasdf");
    return true;
  }

  static Future<bool> savePetCheckData(bool isPetCheckStatus) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool("isPetCheck", isPetCheckStatus);
  }

  static Future<String?> getUserLoogedInStatusFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(anushkaData);
  }

  static Future getAdoptedData() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    // return sf.getString(anushkaData);
    List myList = jsonDecode(sf.getString("adoptedPetPref") ?? "");
    return myList;
  }

  static Future<bool?> getPetCheckData() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool("isPetCheck");
  }
}
