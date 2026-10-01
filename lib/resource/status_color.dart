part of 'resource.dart';

class StatusColor extends ThemeExtension<StatusColor> {
  const StatusColor({
    required this.info,
    required this.onInfo,
    required this.warning,
    required this.onWarning,
    required this.failure,
    required this.onFailure,
    required this.success,
    required this.onSuccess,
  });

  final Color info;
  final Color onInfo;
  final Color warning;
  final Color onWarning;
  final Color failure;
  final Color onFailure;
  final Color success;
  final Color onSuccess;

  Color get infoContainer => info.withAlpha(50);

  Color get onInfoContainer => info;

  Color get warningContainer => warning.withAlpha(50);

  Color get onWarningContainer => warning;

  Color get failureContainer => failure.withAlpha(50);

  Color get onFailureContainer => failure;

  Color get successContainer => success.withAlpha(50);

  Color get onSuccessContainer => success;

  @override
  ThemeExtension<StatusColor> copyWith({
    Color? info,
    Color? onInfo,
    Color? warning,
    Color? onWarning,
    Color? failure,
    Color? onFailure,
    Color? success,
    Color? onSuccess,
  }) {
    return StatusColor(
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      failure: failure ?? this.failure,
      onFailure: onFailure ?? this.onFailure,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }

  @override
  ThemeExtension<StatusColor> lerp(ThemeExtension<StatusColor>? other, double t) {
    if (other is! StatusColor) return this;
    return copyWith(
      info: Color.lerp(info, other.info, t),
      onInfo: Color.lerp(onInfo, other.onInfo, t),
      warning: Color.lerp(warning, other.warning, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
      failure: Color.lerp(failure, other.failure, t),
      onFailure: Color.lerp(onFailure, other.onFailure, t),
      success: Color.lerp(success, other.success, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StatusColor &&
              runtimeType == other.runtimeType &&
              info == other.info &&
              onInfo == other.onInfo &&
              warning == other.warning &&
              onWarning == other.onWarning &&
              failure == other.failure &&
              onFailure == other.onFailure &&
              success == other.success &&
              onSuccess == other.onSuccess;

  @override
  int get hashCode =>
      info.hashCode ^
      onInfo.hashCode ^
      warning.hashCode ^
      onWarning.hashCode ^
      failure.hashCode ^
      onFailure.hashCode ^
      success.hashCode ^
      onSuccess.hashCode;
}

extension StatusColorContextExtension on BuildContext {
  StatusColor get statusColor => Theme.of(this).statusColor;
}

extension StatusColorThemeExtension on ThemeData {
  StatusColor get statusColor {
    var extension = this.extension<StatusColor>();
    assert(extension != null);
    return extension!;
  }
}

