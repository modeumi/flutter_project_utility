import 'package:utility/fire_base.dart';
import 'package:utility/toast_message.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  ToastMessage toast = ToastMessage();

  Future<void> save(String key, dynamic value) async {
    try {
      await storage.write(key: key, value: value.toString());
    } catch (e) {
      LocalStorageError('Secure Storage', e.toString(), 'save', key);
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
