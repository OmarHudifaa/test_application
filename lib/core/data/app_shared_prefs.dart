import 'package:asset_people_application/core/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  String? getUserId() {
    return _preferences.getString(USERID);
  }

  void setUserId(String userId) {
    _preferences.setString(USERID, userId);
  }

  String? getApiKey() {
    return _preferences.getString(APIKEY);
  }

  void setApiKey(String apiKey) {
    _preferences.setString(APIKEY, apiKey);
  }
}
