import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:utility/secure_storage.dart';
import 'package:utility/format.dart';

import 'package:utility/crypto.dart';

Map<String, String> Get_Times() {
  String now_date = date_to_string_yyyyMMdd('-', DateTime.now());
  String now_time = time_to_string('hmss', DateTime.now());
  int hour = int.parse(now_time.split(':').first);
  String meridiem = 'am';
  if (hour > 11) {
    meridiem = 'pm';
  }
  String microsecond = DateTime.now().microsecond.toString();

  return {'date': now_date, 'time': '$now_time$microsecond', 'meridiem': meridiem};
}

void Save_Log(String page, String history) async {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  final SecureStorage storage = SecureStorage();
  Map<String, String> date_time = Get_Times();

  String number = await storage.read('id');
  if (number[0] == '0') {
    number = number.substring(1);
  }
  try {
    await store.collection('Log').doc('${date_time["date"]}_$number').set(
      {date_time['time'] ?? '': '$page : $history'},
      SetOptions(merge: true),
    );
  } catch (e) {
    print(e);
  }
}

void Save_Log_login(String number) async {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  Map<String, String> date_time = Get_Times();

  if (number[0] == '0') {
    number = number.substring(1);
  }
  try {
    await store.collection('Log').doc('${date_time["date"]}_$number').set(
      {date_time['time'] ?? '': 'Login Success'},
      SetOptions(merge: true),
    );
  } catch (e) {
    print(e);
  }
}

void Save_Log_login_false(String number, String pass, [Map<String, dynamic>? else_data]) async {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  Map<String, String> date_time = Get_Times();

  try {
    String crypt_id = cryption(true, number);
    String crypt_pass = cryption(true, pass);
    Map<String, dynamic> data = {
      date_time['time'] ?? '': {'number': crypt_id, 'pass': crypt_pass}
    };

    if (else_data != null) {
      String firstKey = data.keys.toList().first;
      data[firstKey]['else_data'] = jsonEncode(else_data);
    }

    await store.collection('LoginFalse').doc(date_time["date"]).set(data, SetOptions(merge: true));
  } catch (e) {
    print(e);
  }
}

void Save_Log_Join_False(Map<String, dynamic> data) async {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  Map<String, String> date_time = Get_Times();

  try {
    Map<String, dynamic> cryptData = {};
    data.forEach(
      (key, value) {
        cryptData[key] = cryption(true, value);
      },
    );

    Map<String, dynamic> datas = {date_time['time'] ?? '': cryptData};

    await store.collection('LoginFalse').doc(date_time["date"]).set(datas, SetOptions(merge: true));
  } catch (e) {
    print(e);
  }
}

void LocalStorageError(String type, String error, String action, String key) async {
  final FirebaseFirestore store = FirebaseFirestore.instance;
  Map<String, String> date_time = Get_Times();
  DeviceInfoPlugin device = DeviceInfoPlugin();

  try {
    String device_model = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo android_info = await device.androidInfo;
      device_model = android_info.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo ios_info = await device.iosInfo;
      device_model = ios_info.utsname.machine;
    }

    await store.collection('Error').doc('${date_time["date"]}').set({
      date_time['time'] ?? '': '''$type error-------\n
          device : $device_model,\n
          key : $key,\n
          action : $action,\n
          error -----------------------\n
          $error'''
    }, SetOptions(merge: true));
  } catch (e) {
    print(e);
  }
}
