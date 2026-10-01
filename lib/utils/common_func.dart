import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonFunctions {
  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static Future<void> openUrl({required String url}) async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint('Could not launch $url: $e');
    }
  }
}
