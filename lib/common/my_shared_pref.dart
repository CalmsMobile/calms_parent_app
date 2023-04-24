import '/common/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  void saveData(String inputdata, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, inputdata);
  }

  void saveIntData(int inputdata, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, inputdata);
  }

  void saveDoubleData(double inputdata, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, inputdata);
  }

  getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    } else {
      return "";
    }
  }

  getDoubleData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.containsKey(key)) {
        return prefs.getDouble(key);
      } else {
        return 0.toDouble();
      }
    } catch (e) {
      return 0.toDouble();
    }
  }

  clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppSettings.profileData, "");
    prefs.setString(AppSettings.qrCodeData, "");
    prefs.setString(AppSettings.Sp_Key_AppType, "");
    prefs.setString(AppSettings.parentAppPIN, "");
  }
}
