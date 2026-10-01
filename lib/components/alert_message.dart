import 'package:flashlight/core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AlertMessage extends SnackBar {
  AlertMessage({
    super.key,
    required String title,
    String? description,
    required Color? backgroundColor,
    required Color? foregroundColor,
    super.duration,
    super.width,
  }) : super(
    content: _AlertMessageContent(
      key: UniqueKey(),
      title: title,
      description: description,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    ),
    padding: EdgeInsets.zero,
    clipBehavior: Clip.hardEdge,
    behavior: SnackBarBehavior.floating,
  );
}

class _AlertMessageContent extends StatelessWidget {
  const _AlertMessageContent({
    super.key,
    required this.title,
    required this.description,
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final String title;
  final String? description;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final snackBarTheme = theme.snackBarTheme;
    final foregroundColor = this.foregroundColor ?? snackBarTheme.contentTextStyle?.color ?? colorScheme.onSurface;

    return Material(
      shape: snackBarTheme.shape,
      clipBehavior: Clip.hardEdge,
      color: colorScheme.surface,
      child: Material(
        shape: snackBarTheme.shape,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 16, 8),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: foregroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: foregroundColor),
                      ),
                      if (description != null && description!.isNotEmpty)
                        Text(
                          description!,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: foregroundColor),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Card(
      color: colorScheme.errorContainer,
      elevation: 0,
      child: DefaultTextStyle.merge(
        textAlign: TextAlign.center,
        style: TextStyle(color: colorScheme.onErrorContainer),
        child: child,
      ),
    );
  }
}
