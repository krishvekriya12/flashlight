import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flutter/material.dart';


Future<T?> showAppModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double? maxBottomHeight,
  bool barrierDismissible = true,
  bool showDragHandle = false,
}) async {
  final maxHeight = maxBottomHeight ?? (context.height - kToolbarHeight - context.padding.top);
  return await showModalBottomSheet(
    context: context,
    backgroundColor: context.colorScheme.surface,

    builder: (context) => PopScope(
      canPop: barrierDismissible,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: builder(context),
      ),
    ),
    isDismissible: barrierDismissible,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: false,
  );
}

Future<T> showAppDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? backgroundColor,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: Spacing.large),
      backgroundColor: Colors.transparent,

      child: PopScope(
        canPop: barrierDismissible,
        child: Container(
          padding: EdgeInsets.all(Spacing.normal),
          decoration: BoxDecoration(
             color: backgroundColor ?? context.colorScheme.surfaceContainer,
            borderRadius: ShapeBorderRadius.large,
            boxShadow: backgroundColor == Colors.transparent
                ? []
                : [BoxShadow(color: Colors.black.withColorOpacity(0.1), blurRadius: 14, offset: Offset(0, 0))],
          ),
          child: builder(context),
        ),
      ),
    ),
  );
}
