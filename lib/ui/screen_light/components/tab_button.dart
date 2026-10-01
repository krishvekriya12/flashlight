part of '../screen_light.dart';
class _TabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final Widget icon;

  const _TabButton({required this.title, required this.selected, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Gap(Spacing.xSmall),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
