import 'package:flutter/material.dart';
import 'package:flashlight/resource/resource.dart';

class ShimmerButton extends StatelessWidget {
  const ShimmerButton({super.key, required this.onTap, required this.title});
  final VoidCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: AppPress(
      onTap: onTap,
      child: FilledButton(
        onPressed: onTap,
        child: Text(title, textAlign: TextAlign.center),
      ),
    ),
  );
}
