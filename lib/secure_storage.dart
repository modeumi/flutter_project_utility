import 'package:utile/fire_base.dart';
import 'package:utile/toast_message.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  ToastMessage toast = ToastMessage();

  Future<void> save(Map<String, dynamic> datas) async {
    String error_key = '';
    try {
      for (String key in datas.keys) {
        error_key = key;
        await storage.write(key: key, value: datas[key]);
      }
    } catch (e) {
      LocalStorageError('Secure Storage', e.toString(), 'save', error_key);
    }
  }

  Future<String> read(String key) async {
    try {
      String data = await storage.read(key: key) ?? '';
      return data;
    } catch (e) {
      LocalStorageError('Secure Storage', e.toString(), 'read', key);
      ToastMessage().ShowToast('데이터 로드 실패');
      return '';
    }
  }

  Future<void> delete(List<String> keys) async {
    String error_key = '';
    try {
      for (String key in keys) {
        error_key = key;
        await storage.delete(key: key);
      }
    } catch (e) {
      LocalStorageError('Secure Storage', e.toString(), 'delete', error_key);
    }
  }

  Future<void> delete_all() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      LocalStorageError('Secure Storage', e.toString(), 'delete_all', '');
    }
  }

  Future<bool> autologin() async {
    String autologin = await read('autologin');
    if (autologin == '') {
      autologin = 'false';
    }
    return bool.parse(autologin);
  }

  // secure storage 저장 데이터 확인용 함수
  Future<void> GetKeys() async {
    Map<String, String> alldate = await storage.readAll();
    alldate.forEach(
      (key, value) {
        print('$key : $value');
      },
    );
  }
}
