import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flashlight/components/flash_light_app_bar.dart';
import 'package:flashlight/core/core.dart';
import 'package:flashlight/resource/resource.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});
  static const routeName = '/privacy-policy';
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  late Future<String> _policy = rootBundle.loadString(
    'assets/privacy_policy.md',
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: FlashLightAppBar(title: context.l10n.privacyPolicy),
    body: FutureBuilder<String>(
      future: _policy,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: IconButton.filledTonal(
              tooltip: context.l10n.privacyPolicy,
              onPressed: () => setState(() {
                _policy = rootBundle.loadString('assets/privacy_policy.md');
              }),
              icon: const Icon(Icons.refresh_rounded),
            ),
          );
        }
        if (!snapshot.hasData) return const Center(child: ExpressiveLoader());
        final paragraphs = snapshot.data!.split('\n\n');
        return AppContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: paragraphs.where((p) => p.trim().isNotEmpty).map((
              paragraph,
            ) {
              final heading = paragraph.startsWith('#');
              final text = paragraph.replaceFirst(RegExp(r'^#+\s*'), '').trim();
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xLarge),
                child: Semantics(
                  header: heading,
                  child: SelectableText(
                    text,
                    style: heading
                        ? context.textTheme.titleLarge
                        : context.textTheme.bodyLarge,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    ),
  );
}
