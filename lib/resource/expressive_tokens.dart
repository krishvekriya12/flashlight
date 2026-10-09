part of 'resource.dart';

abstract final class AppDesign {
  static const double touchTarget = 48;
  static const double iconSize = 24;
  static const double heroSize = 200;
  static const double contentWidth = 840;
  static const double railBreakpoint = 600;
  static const double expandedBreakpoint = 840;
  static const double railWidth = 104;
  static const double wideRailWidth = 184;
  static const double navigationHeight = 80;
  static const double heroRadius = 64;
  static const double selectedRadius = 24;
  static const double idleRadius = 40;
  static const double pressedScale = .96;
  static const int seedValue = 0xFF006D5B;
}

abstract final class AppMotion {
  static const spatial = SpringDescription(
    mass: 1,
    stiffness: 380,
    damping: 28,
  );
  static const effects = SpringDescription(
    mass: 1,
    stiffness: 400,
    damping: 40,
  );
  static const Duration effectsDuration = Duration(milliseconds: 220);
  static const Duration ambientDuration = Duration(milliseconds: 1600);
  static Duration duration(BuildContext context) =>
      MediaQuery.disableAnimationsOf(context) ? Duration.zero : effectsDuration;
}
