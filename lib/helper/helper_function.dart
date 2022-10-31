import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  /// save and retrive data from shared preferences
  /// userLoggedInKey, userNameKey, userEmailKey

  // key to save
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USEREMAILKEY";

  // save data to shared preferences

  // get data from shared preferences
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey); // if particular key exists, return true
  }
}
