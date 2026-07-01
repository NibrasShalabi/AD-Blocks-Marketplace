import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = [
      (Icons.mail_outline, l10n.privacyData),
      (Icons.analytics_outlined, l10n.privacyAnalytics),
      (Icons.money_off, l10n.privacyNoSell),
      (Icons.schedule, l10n.privacyRetention),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.go('/'),
        ),
        title: Text(l10n.privacyTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items
                  .map((it) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.blockBorder),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(it.$1,
                        color: AppColors.vipGold, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(it.$2,
                          style: const TextStyle(
                              fontSize: 14, height: 1.6)),
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}