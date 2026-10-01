import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';
import 'package:flashlight/utils/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FlashLightAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? onBack;
  final bool showBgColour;
  final bool? showBackButton;

  const FlashLightAppBar({
    super.key,
    this.titleWidget,
    this.leading,
    this.title,
    this.actions,
    this.onBack,
    this.showBgColour = false,
    this.showBackButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final bool canGoBack = showBackButton ?? context.navigator.canPop();

    return Container(
      decoration: BoxDecoration(color: showBgColour ? context.colorScheme.onPrimary : null),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            leading:
            leading ??
                (canGoBack
                    ? CommonButton.cupertino(
                  onTap:
                  onBack ??
                          () {
                        context.navigator.pop();
                      },
                  child: Icon(
                    CupertinoIcons.chevron_back,
                    size: Spacing.xLarge,
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface,
                  ),
                )
                    : null),
            leadingWidth: canGoBack ? 44 : 0,
            titleSpacing: canGoBack ? 4 : 16,

            automaticallyImplyLeading: canGoBack,
            centerTitle: false,

            title:
            titleWidget ??
                (title != null
                    ? Text(
                  title!,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                  ),
                )
                    : null),

            actions: actions,
          ),
          if (showBgColour) Gap(Spacing.xSmall),
        ],
      ),
    );
  }
}
