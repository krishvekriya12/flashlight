import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'modal.dart';

class AppAlertDialog extends StatelessWidget {
  static Future show({
    required BuildContext context,
    required String title,
    required String content,
    required String doneText,
    Color? doneTextColor,
    required void Function() onDone,
  }) {
    return showAppDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        title: title,
        content: content,
        doneText: doneText,
        doneTextColor: doneTextColor,
        onDone: onDone,
      ),
    );
  }

  final String title;
  final String doneText;
  final String content;
  final Color? doneTextColor;
  final void Function() onDone;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.doneText,
    this.doneTextColor,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromSTEB(20, 20, 20, Spacing.medium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: context.textTheme.titleLarge),
          Gap(Spacing.small),
          Text(content, style: context.textTheme.labelSmall),
          Gap(Spacing.normal),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.navigator.pop();
                },
                child: Text(
                 " context.l10n.cancel",
                  style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ),
              Gap(Spacing.medium),
              TextButton(
                onPressed: () {
                  context.navigator.pop();
                  onDone.call();
                },
                child: Text(
                  doneText,
                  style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
