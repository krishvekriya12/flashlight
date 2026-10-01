import 'package:flutter/material.dart';
import 'package:flashlight/data/preference/preference_keys.dart';
import 'package:flashlight/utils/app_constants.dart';
import 'package:flashlight/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  Preference._();

  static final Preference _instance = Preference._();

  factory Preference() => _instance;

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  AppLanguage get appLanguage {
    final value = prefs?.getString(PreferenceKeys.appLanguage);

    for (final language in AppLanguage.values) {
      if (language.value == value) {
        return language;
      }
    }

    return AppLanguage.english;
  }

  set appLanguage(AppLanguage lang) {
    prefs?.setString(PreferenceKeys.appLanguage, lang.value);
  }

  set languageSelected(bool status) {
    prefs?.setBool(PreferenceKeys.languageSelected, status);
  }

  bool get languageSelected {
    return prefs?.getBool(PreferenceKeys.languageSelected) ?? false;
  }

  int get screenLightColor {
    return prefs?.getInt(PreferenceKeys.screenLightColor) ?? AppConstant.screenLightDefaultColor;
  }

  set screenLightColor(int value) {
    prefs?.setInt(PreferenceKeys.screenLightColor, value);
  }

  int get screenLightPresetIndex {
    return prefs?.getInt(PreferenceKeys.screenLightPresetIndex) ?? AppConstant.screenLightCustomIndex;
  }

  set screenLightPresetIndex(int value) {
    prefs?.setInt(PreferenceKeys.screenLightPresetIndex, value);
  }

  bool get enableForRing {
    return prefs?.getBool(PreferenceKeys.enableForRing) ?? true;
  }

  set enableForRing(bool value) {
    prefs?.setBool(PreferenceKeys.enableForRing, value);
  }

  bool get enableForVibrate {
    return prefs?.getBool(PreferenceKeys.enableForVibrate) ?? true;
  }

  set enableForVibrate(bool value) {
    prefs?.setBool(PreferenceKeys.enableForVibrate, value);
  }

  bool get enableForSilent {
    return prefs?.getBool(PreferenceKeys.enableForSilent) ?? true;
  }

  set enableForSilent(bool value) {
    prefs?.setBool(PreferenceKeys.enableForSilent, value);
  }

  ThemeMode get themeMode {
    final value = prefs?.getString(PreferenceKeys.themeMode);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  set themeMode(ThemeMode mode) {
    prefs?.setString(PreferenceKeys.themeMode, mode.name);
  }

  void clear() {
    prefs?.clear();
  }
}
