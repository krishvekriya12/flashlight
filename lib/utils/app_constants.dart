abstract interface class AppConstant {
  static const String appVersion = "1.0.0";
  static const String packageName = "com.setubandhTech.flashlight";
  static const String playStoreUrl =
      "https://play.google.com/store/apps/details?id=$packageName";
  static const List<int> screenLightPresets = [
    0xFFEF4444,
    0xFFF97316,
    0xFFFBBF24,
    0xFF10B981,
    0xFF3B82F6,
    0xFF6366F1,
    0xFFA855F7,
  ];
  static const int screenLightCustomIndex = 6;
  static const int screenLightDefaultColor = -12909834;
  static const int screenLightBlinkInterval = 750;
  static const int screenLightBlinkResetInterval = 500;
}
