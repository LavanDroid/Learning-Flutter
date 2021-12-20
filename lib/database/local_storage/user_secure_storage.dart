import 'dart:convert';

import 'package:flutter_demo/base/app_extension.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const storage = FlutterSecureStorage();

  static Future deleteSingleKey(String key) async =>
      await storage.delete(key: key);

  static Future deleteMultipleKey(List<String> keys) async {
    try {
      dynamic value;
      for (final String removedKey in keys) {
        value = await storage.read(key: removedKey);
        if (value != null) {
          deleteSingleKey(removedKey);
        }
      }
    } on Exception catch (e) {
      AppPrint.getStaticPrint('DeleteMultipleKey Ex: $e');
    }
  }

  static Future deleteAll() async => await storage.deleteAll();

  //* String
  static Future setString(String key, String value) async =>
      await storage.write(key: key, value: value);
  //onClicked: () async { await UserStorage.setString(UserStorageKeys.userName, 'userName'); });

  static Future<String?> getString(String key) async =>
      await storage.read(key: key);
  // name = UserStorage.getString(UserStorageKeys.userName) ?? '';

  //* Int
  static Future setInt(String key, int number) async {
    final value = number.toString();
    await storage.write(key: key, value: value);
  }

  static Future<int?> getInt(String key) async {
    final value = await storage.read(key: key);
    return value == null ? null : int.parse(value);
  }

  //* Boolean
  static Future setBoolean(String key, bool boolean) async {
    final value = boolean ? '1' : '0';
    await storage.write(key: key, value: value);
  }

  static Future<bool?> getBoolean(String key) async {
    final value = await storage.read(key: key);
    return value == null
        ? null
        : value == '1'
            ? true
            : false;
  }

  //* Date Time  (dd/MM/YYYY) , (HH:mm:aa)
  static Future setDateTime(String key, DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();
    await storage.write(key: key, value: birthday);
  }

  static Future<DateTime?> getDateTime(String key) async {
    final birthday = await storage.read(key: key);
    return birthday == null ? null : DateTime.tryParse(birthday);
  }

  //* List<String>
  static Future setStringList(String key, List<String> list) async {
    try {
      final value = json.encode(list);
      await storage.write(key: key, value: value);
    } on Exception catch (e) {
      AppPrint.getStaticPrint('Set storage list Ex: $e');
    }
  }

  static Future<List<String>?> getStringList(String key) async {
    try {
      final value = await storage.read(key: key);
      return value == null ? null : List<String>.from(json.decode(value));
    } on Exception catch (e) {
      AppPrint.getStaticPrint('Get storage list Ex: $e');
    }
  }

  //* Model class
  /* static Future setUserModel(String key, UserModel usermodel) async {
    final value = json.encode(usermodel.toJson());
    await storage.write(key: key, value: value);
  }

  static Future<UserModel>? getUserModel(String key) async {
    final value = await storage.read(key: key);
    if (value?.isNotEmpty ?? false)
      return Usermodel.fromJson(json.decode(value!));

    return null;
  } */
}
