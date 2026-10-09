import 'package:flutter/material.dart';
import 'package:flashlight/resource/resource.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.loadingMessage});
  final String? loadingMessage;
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ExpressiveLoader(),
        if (loadingMessage?.isNotEmpty ?? false) ...[
          const SizedBox(height: Spacing.normal),
          Text(
            loadingMessage!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ],
    ),
  );
}
