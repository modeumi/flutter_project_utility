import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility/fire_base.dart';

class SharePreference {
  SharedPreferencesAsync prefs = SharedPreferencesAsync();

  Future<void> save(String type, String key, dynamic value) async {
    try {
      type == 'String'
          ? await prefs.setString(key, value)
          : type == 'bool'
              ? await prefs.setBool(key, value)
              : type == 'list'
                  ? await prefs.setStringList(key, value)
                  : type == 'double'
                      ? await prefs.setDouble(key, value)
                      : type == 'int'
                          ? await prefs.setInt(key, value)
                          : null;
    } catch (e) {
      LocalStorageError('Shared Preferences', e.toString(), 'save', key);
    }
  }

  Future<dynamic> read(String type, String key) async {
    try {
      dynamic data = type == 'String'
          ? await prefs.getString(key) ?? ''
          : type == 'bool'
              ? await prefs.getBool(key) ?? false
              : type == 'list'
                  ? await prefs.getStringList(key) ?? []
                  : type == 'double'
                      ? await prefs.getDouble(key) ?? 0
                      : type == 'int'
                          ? await prefs.getInt(key) ?? 0
                          : 'null';
      return data;
    } catch (e) {
      LocalStorageError('Shared Preferences', e.toString(), 'read', key);
      return '';
    }
  }

  Future<void> delete(List<String> keys) async {
    String error_key = '';
    try {
      for (String key in keys) {
        error_key = key;
        await prefs.remove(key);
      }
    } catch (e) {
      LocalStorageError('Shared Preferences', e.toString(), 'delete', error_key);
    }
  }

  Future<void> delete_all() async {
    await prefs.clear();
  }

  Future<List<dynamic>> Get_Keys() async {
    try {
      dynamic value = await prefs.getKeys();
      List<String> keys = value.toList();
      return keys;
    } catch (e) {
      LocalStorageError('Shared Preferences', e.toString(), 'Get_Keys', '');
      return [];
    }
  }
}
