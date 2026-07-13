import 'package:utility/fire_base.dart';
import 'package:utility/toast_message.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorage extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
  );
  ToastMessage toast = ToastMessage();

  Future<void> save(String key, dynamic value) async {
    try {
      await storage.write(key: key, value: value.toString());
    } catch (e) {
      // -25299 (errSecDuplicateItem): accessibility 미스매치로 옛 항목이 남아있어 add 실패
      // → 옛 항목 삭제 후 재저장 (자연 마이그레이션)
      if (e.toString().contains('-25299')) {
        try {
          await storage.delete(key: key);
          await storage.write(key: key, value: value.toString());
          return;
        } catch (e2) {
          LocalStorageError('Secure Storage', e2.toString(), 'save-retry', key);
          return;
        }
      }
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
