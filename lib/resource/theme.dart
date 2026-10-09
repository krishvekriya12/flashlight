part of 'resource.dart';

ThemeData get lightTheme => expressiveTheme(brightness: Brightness.light);

ThemeData get darkTheme => expressiveTheme(brightness: Brightness.dark);

ThemeData expressiveTheme({required Brightness brightness, Color? seed}) =>
    _getThemeData(
      ColorScheme.fromSeed(
        seedColor: seed ?? const Color(AppDesign.seedValue),
        brightness: brightness,
        dynamicSchemeVariant: DynamicSchemeVariant.expressive,
      ),
    );

ThemeData _getThemeData(ColorScheme colorScheme) => ThemeData(
  useMaterial3: true,
  fontFamily: FontFamily.roboto,
  colorScheme: colorScheme,
  brightness: colorScheme.brightness,
  scaffoldBackgroundColor: colorScheme.surface,
  primaryColor: colorScheme.primary,
  extensions: {appColor},
  canvasColor: colorScheme.surface,
  visualDensity: VisualDensity.standard,
  cardTheme: CardThemeData(
    elevation: 0,
    color: colorScheme.surfaceContainerLow,
    shape: const RoundedRectangleBorder(
      borderRadius: ShapeBorderRadius.xxLarge,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      minimumSize: const Size(AppDesign.touchTarget, AppDesign.touchTarget),
    ),
  ),
  textTheme: _textTheme(colorScheme),
  snackBarTheme: _snackBarThemeData(colorScheme),
  dialogTheme: _dialogTheme(colorScheme),
  bottomSheetTheme: _bottomSheetThemeData(colorScheme),
  datePickerTheme: _datePickerThemeData(colorScheme),
  timePickerTheme: _timePickerThemeData(colorScheme),
  scrollbarTheme: _scrollbarThemeData(colorScheme),
  popupMenuTheme: _popupMenuThemeData(colorScheme),
  appBarTheme: _appBarTheme(colorScheme),
  checkboxTheme: _checkBoxThemeData(colorScheme),
  bottomNavigationBarTheme: _bottomNavigationBarThemeData(colorScheme),
  elevatedButtonTheme: _elevatedButtonThemeData(colorScheme),
  outlinedButtonTheme: _outlinedButtonThemeData(colorScheme),
  dropdownMenuTheme: _dropdownMenuThemeData(colorScheme),
  filledButtonTheme: _filledButtonThemeData(colorScheme),
  switchTheme: _switchThemeData(colorScheme),
  inputDecorationTheme: _inputDecorationTheme(colorScheme),
  textButtonTheme: _textButtonThemeData(colorScheme),
  sliderTheme: _sliderThemeData(colorScheme),
  tabBarTheme: TabBarThemeData(indicatorColor: colorScheme.primary),

  dividerTheme: DividerThemeData(
    color: colorScheme.outline,
    space: 1,
    thickness: 1,
  ),
);

StatusColor get appColor => StatusColor(
  info: Color(0xFF6E3047),
  onInfo: Color(0xFFFFFFFF),
  warning: Color(0xFFF1A62D),
  onWarning: Color(0xFFFFFFFF),
  failure: Color(0xFFDC2626),
  onFailure: Color(0xFFFFFFFF),
  success: Color(0xFF17995C),
  onSuccess: Color(0xFFFFFFFF),
);

TextTheme _textTheme(ColorScheme colors) {
  final base = colors.brightness == Brightness.dark
      ? Typography.material2021().white
      : Typography.material2021().black;
  final themed = base.apply(
    fontFamily: FontFamily.roboto,
    bodyColor: colors.onSurface,
    displayColor: colors.onSurface,
  );
  return themed.copyWith(
    displaySmall: themed.displaySmall?.copyWith(fontWeight: FontWeight.w800),
    headlineLarge: themed.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
    headlineMedium: themed.headlineMedium?.copyWith(
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: themed.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
    titleLarge: themed.titleLarge?.copyWith(fontWeight: FontWeight.w700),
  );
}

SnackBarThemeData _snackBarThemeData(ColorScheme colorScheme) {
  return SnackBarThemeData(
    backgroundColor: colorScheme.primary,
    insetPadding: EdgeInsets.fromLTRB(
      Spacing.normal,
      Spacing.normal,
      Spacing.normal,
      Spacing.small,
    ),
    shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
    behavior: SnackBarBehavior.floating,
    elevation: 8,
    actionTextColor: colorScheme.onPrimary,
    disabledActionTextColor: colorScheme.onSurfaceVariant,
  );
}

DialogThemeData _dialogTheme(ColorScheme colorScheme) {
  final textTheme = _textTheme(colorScheme);
  return DialogThemeData(
    backgroundColor: colorScheme.surfaceContainer,
    shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
    elevation: 4,
    barrierColor: Colors.black.withColorOpacity(0.7),
    titleTextStyle: textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    ),
  );
}

BottomSheetThemeData _bottomSheetThemeData(ColorScheme colorScheme) {
  return BottomSheetThemeData(
    backgroundColor: colorScheme.surfaceContainer,
    modalBackgroundColor: colorScheme.surfaceContainer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: RadiusValues.xLarge),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

DatePickerThemeData _datePickerThemeData(ColorScheme colorScheme) {
  return DatePickerThemeData(
    shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.xLarge),
    headerBackgroundColor: colorScheme.primary,
    headerForegroundColor: colorScheme.onPrimary,
  );
}

TimePickerThemeData _timePickerThemeData(ColorScheme colorScheme) {
  return TimePickerThemeData(
    shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.large),
    backgroundColor: colorScheme.surface,
    padding: EdgeInsets.all(Spacing.normal),
    dialBackgroundColor: colorScheme.surfaceContainer,
    helpTextStyle: _textTheme(colorScheme).labelSmall?.copyWith(
      color: colorScheme.onPrimaryContainer,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
    ),
    timeSelectorSeparatorColor: WidgetStatePropertyAll(
      colorScheme.onPrimaryContainer,
    ),
    timeSelectorSeparatorTextStyle: WidgetStatePropertyAll(
      _textTheme(
        colorScheme,
      ).headlineLarge?.copyWith(color: colorScheme.primary),
    ),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: BorderSide(color: colorScheme.onPrimaryFixed),
    ),
    hourMinuteColor: colorScheme.onPrimaryFixed.withColorOpacity(.35),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.onSurface;
    }),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    dayPeriodBorderSide: BorderSide(color: colorScheme.outline),
    dialTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.onSurface;
      }
      return colorScheme.onSurfaceVariant;
    }),
    dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.onPrimaryContainer;
    }),
    dayPeriodColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary.withColorOpacity(0.2);
      }
      return colorScheme.onPrimaryFixed.withColorOpacity(0.2);
    }),
    dayPeriodTextStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return _textTheme(colorScheme).labelSmall!.copyWith(
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        );
      }
      return _textTheme(colorScheme).labelSmall!.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.onPrimaryContainer,
      );
    }),
    entryModeIconColor: colorScheme.primary,
    cancelButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
      textStyle: WidgetStatePropertyAll(
        _textTheme(
          colorScheme,
        ).labelLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
      textStyle: WidgetStatePropertyAll(
        _textTheme(
          colorScheme,
        ).labelLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
  );
}

ScrollbarThemeData _scrollbarThemeData(ColorScheme colorScheme) {
  return ScrollbarThemeData(
    thickness: WidgetStatePropertyAll(Spacing.xSmall),
    thumbColor: WidgetStatePropertyAll(colorScheme.onSurfaceVariant),
    mainAxisMargin: Spacing.small,
    radius: RadiusValues.xSmall,
    crossAxisMargin: 2,
    interactive: true,
    trackColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
  );
}

PopupMenuThemeData _popupMenuThemeData(ColorScheme colorScheme) {
  return PopupMenuThemeData(
    color: colorScheme.surface,
    elevation: 10,
    surfaceTintColor: colorScheme.surface,
    shadowColor: colorScheme.shadow,
    shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
    position: PopupMenuPosition.under,
  );
}

AppBarTheme _appBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: colorScheme.onSurface,
    scrolledUnderElevation: 0,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: colorScheme.onSurface),
    actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
    titleTextStyle: _textTheme(colorScheme).titleLarge?.copyWith(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: -0.2,
    ),
    systemOverlayStyle: colorScheme.brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(
  ColorScheme colorScheme,
) {
  return BottomNavigationBarThemeData(
    backgroundColor: colorScheme.surface,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.onSurfaceVariant,
    selectedLabelStyle: _textTheme(
      colorScheme,
    ).labelMedium?.copyWith(fontWeight: FontWeight.w600),
    unselectedLabelStyle: _textTheme(
      colorScheme,
    ).labelMedium?.copyWith(fontWeight: FontWeight.w500),
  );
}

CheckboxThemeData? _checkBoxThemeData(ColorScheme colorScheme) {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(4),
    ),
    side: BorderSide(color: colorScheme.outline),

    visualDensity: VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.primary.withColorOpacity(0.5),
      disabledForegroundColor: colorScheme.onPrimary,
      textStyle: _textTheme(colorScheme).labelLarge?.copyWith(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.normal),
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.xLarge,
        vertical: Spacing.medium,
      ),
      minimumSize: Size(96, 48),
    ),
  );
}

OutlinedButtonThemeData _outlinedButtonThemeData(ColorScheme colorScheme) {
  return OutlinedButtonThemeData(
    style:
        ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: ShapeBorderRadius.xxLarge,
            side: BorderSide(color: colorScheme.primary),
          ),
          textStyle: _textTheme(colorScheme).labelLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.xLarge,
            vertical: Spacing.medium,
          ),
          minimumSize: Size(96, 48),
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ).copyWith(
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(color: colorScheme.surfaceDim);
            }
            return BorderSide(color: colorScheme.secondary);
          }),
        ),
  );
}

FilledButtonThemeData _filledButtonThemeData(ColorScheme colorScheme) {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.surfaceDim,
      disabledForegroundColor: colorScheme.onSurfaceVariant,
      textStyle: _textTheme(colorScheme).labelLarge?.copyWith(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
      shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.xxLarge),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.xLarge,
        vertical: Spacing.medium,
      ),
      minimumSize: Size(96, 56),
    ),
  );
}

SwitchThemeData _switchThemeData(ColorScheme colorScheme) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.onPrimary;
      }
      return colorScheme.outline;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.surfaceContainer;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return colorScheme.outline;
    }),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

TextButtonThemeData _textButtonThemeData(ColorScheme colorScheme) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colorScheme.onSurface,
      shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.xxLarge),
      textStyle: _textTheme(colorScheme).labelLarge?.copyWith(
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.small,
        vertical: Spacing.xSmall,
      ),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      minimumSize: Size(0, AppDesign.touchTarget),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
  final border = OutlineInputBorder(
    borderRadius: ShapeBorderRadius.xxLarge,
    borderSide: BorderSide(color: colorScheme.outline, width: 0),
  );

  final iconColor = WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.error)) return colorScheme.error;
    if (states.contains(WidgetState.focused)) return colorScheme.primary;
    return colorScheme.onSurfaceVariant;
  });

  return InputDecorationTheme(
    errorMaxLines: 4,
    hintStyle: _textTheme(colorScheme).bodyLarge?.copyWith(
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurfaceVariant,
    ),
    errorStyle: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 14,
      vertical: Spacing.medium,
    ),
    border: border,
    disabledBorder: border,
    enabledBorder: border,
    focusedBorder: border.copyWith(
      borderSide: BorderSide(color: colorScheme.primary),
    ),
    focusedErrorBorder: border.copyWith(
      borderSide: BorderSide(color: colorScheme.error),
    ),
    errorBorder: border.copyWith(
      borderSide: BorderSide(color: colorScheme.error),
    ),
    suffixIconColor: iconColor,
    prefixIconColor: iconColor,
    fillColor: colorScheme.surfaceContainer,
    filled: true,
    isDense: true,
  );
}

DropdownMenuThemeData _dropdownMenuThemeData(ColorScheme colorScheme) {
  final border = OutlineInputBorder(
    borderRadius: ShapeBorderRadius.xxLarge,
    borderSide: BorderSide(color: colorScheme.outline, width: 1),
  );

  final iconColor = WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.error)) return colorScheme.error;
    if (states.contains(WidgetState.focused)) return colorScheme.primary;
    return colorScheme.onSurfaceVariant;
  });

  return DropdownMenuThemeData(
    textStyle: _textTheme(colorScheme).labelLarge,
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 4,
      hintStyle: _textTheme(colorScheme).labelLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurfaceVariant,
      ),
      errorStyle: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Spacing.normal,
        vertical: Spacing.medium,
      ),
      border: border,
      disabledBorder: border,
      enabledBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,
      errorBorder: border,
      suffixIconColor: iconColor,
      prefixIconColor: iconColor,
      fillColor: colorScheme.surfaceContainer,
      filled: true,
    ),
  );
}

SliderThemeData _sliderThemeData(ColorScheme colorScheme) {
  return SliderThemeData(
    trackHeight: Spacing.medium,
    trackShape: const RoundedRectSliderTrackShape(),
    activeTrackColor: colorScheme.primary,
    inactiveTrackColor: colorScheme.outlineVariant.withColorOpacity(0.4),
    thumbColor: colorScheme.primary,
    thumbShape: const RoundSliderThumbShape(
      enabledThumbRadius: 9,
      elevation: 2,
      pressedElevation: 4,
    ),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
    overlayColor: colorScheme.primary.withColorOpacity(0.12),
    tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 2),
    activeTickMarkColor: colorScheme.onPrimary,
    inactiveTickMarkColor: colorScheme.onSurfaceVariant.withColorOpacity(0.3),
  );
}
