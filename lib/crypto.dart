import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// type 이 true 면 암호화 , false 면 복호화
String cryption(bool type, String value) {
  final crypt_key = encrypt.Key(Uint8List.fromList(dotenv.env['CryptKey']!.codeUnits));
  final crypt_iv = encrypt.IV(Uint8List.fromList(dotenv.env['CryptIV']!.codeUnits));
  final crypter = encrypt.Encrypter(encrypt.AES(crypt_key));
  late final crypted;
  String return_value = '';
  if (value != '') {
    if (type) {
      // 암호화
      crypted = crypter.encrypt(value, iv: crypt_iv);
      return_value = crypted.base64;
    } else {
      // 복호화
      crypted = crypter.decrypt64(value, iv: crypt_iv);
      return_value = crypted;
    }
  }
  return return_value;
}
