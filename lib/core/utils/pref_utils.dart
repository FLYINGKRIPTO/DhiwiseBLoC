import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  factory PrefUtils() {
    return _instance!;
  }

  PrefUtils._internal();

  static SharedPreferences? _sharedPreferences;

  static final PrefUtils? _instance = PrefUtils._internal();

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setId(String value) {
    return _sharedPreferences!.setString('id', value);
  }

  String getId() {
    try {
      return _sharedPreferences!.getString('id') ?? '';
    } catch (e) {
      return '';
    }
  }
}
