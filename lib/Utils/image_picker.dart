import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Utility {


  static const String IMAGE_KEY = "IMAGES_KEY";
  static const String USER_NAME_KEY = "USER_NAME_KEY";
  static const String MOBILE_NUMBER_KEY = "MOBILE_NUMBER_KEY";

  final Future<SharedPreferences> prefs =  SharedPreferences.getInstance();

  ///*************SAVE IMAGE FROM CAMERA/GALLERY**************///

  static Future<String?> getImageByPref() async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.getString(IMAGE_KEY) ?? null;
  }

  static Future<bool> setImageByPref(String value) async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.setString(IMAGE_KEY, value);
  }

  ///*************SAVE USER NAME**************///

  static Future<String?> getUserNameByPref() async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_NAME_KEY) ?? "";
  }

  static Future<bool?> setUsernameByPref(String value) async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.setString(USER_NAME_KEY, value);
  }

  ///*************SAVE MOBILE NUMBER**************///

  static Future<String?> getMobileNumberByPref() async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.getString(MOBILE_NUMBER_KEY) ?? "";
  }

  static Future<bool?> setMobileNumberByPref(String value) async {
    final  prefs = await SharedPreferences.getInstance();
    return prefs.setString(MOBILE_NUMBER_KEY, value);
  }

}

