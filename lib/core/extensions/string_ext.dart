part of '../core.dart';
extension $NullableStringExtension on String? {
  bool get isNullOrEmpty => this?.trim().isEmpty ?? true;

  int toInt() {
    return this == null ? 0 : int.tryParse(this!) ?? 0;
  }

  double toDouble() {
    return this == null ? 0 : double.tryParse(this!) ?? 0.0;
  }

  String capitalizeFirstLetter() {
    if ((this ?? "").isEmpty) return this ?? "";
    return this![0].toUpperCase() + this!.substring(1);
  }
}

