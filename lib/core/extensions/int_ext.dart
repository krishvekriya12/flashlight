part of '../core.dart';
extension DurationExit on int {
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);

  String get convertToMultiDigits {
    if (this < 10) {
      return ("0$this");
    }
    return toString();
  }
}

