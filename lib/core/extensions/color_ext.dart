part of '../core.dart';
extension ColorOpacityExtension on Color {
  Color withColorOpacity(double opacity) {
    return withValues(alpha: opacity);
  }
}
