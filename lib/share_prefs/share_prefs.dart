import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instancia = SharedPrefs._internal();

  SharedPrefs._internal();

  factory SharedPrefs() {
    return _instancia;
  }

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }
}
