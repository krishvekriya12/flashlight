import 'package:wakelock_plus/wakelock_plus.dart';

/// Keeps concurrent light modes from releasing each other's screen wake lock.
abstract final class AppWakeLock {
  static final Set<Object> _owners = <Object>{};
  static Future<void> _pending = Future<void>.value();

  static Future<void> acquire(Object owner) {
    _owners.add(owner);
    return _sync();
  }

  static Future<void> release(Object owner) {
    _owners.remove(owner);
    return _sync();
  }

  static Future<void> _sync() {
    // Recover from a plugin failure so future owners can still update the lock.
    _pending = _pending.catchError((Object _) {}).then((_) async {
      await WakelockPlus.toggle(enable: _owners.isNotEmpty);
    });
    return _pending;
  }
}
