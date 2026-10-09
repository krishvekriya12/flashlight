import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemColorProvider extends ChangeNotifier with WidgetsBindingObserver {
  SystemColorProvider() {
    WidgetsBinding.instance.addObserver(this);
    refresh();
  }
  Color? seed;
  bool _disposed = false;
  Future<void> refresh() async {
    try {
      final value = await const MethodChannel(
        'flashlight/settings',
      ).invokeMethod<int>('getSystemColor');
      if (_disposed) return;
      final next = value == null ? null : Color(value);
      if (next != seed) {
        seed = next;
        notifyListeners();
      }
    } on MissingPluginException {
      // Branded fallback on platforms without Android dynamic colors.
    } on PlatformException {
      // A theme lookup must not interrupt the app's device controls.
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) refresh();
  }

  @override
  void dispose() {
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
