import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class ChooseTypePage extends StatelessWidget {
  const ChooseTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.go('/'),
        ),
        title: Text(l10n.chooseType),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TypeCard(
                  icon: Icons.grid_view,
                  title: l10n.normalAd,
                  desc: l10n.normalAdDesc,
                  gold: false,
                  onTap: () => context.go('/packages'),
                ),
                const SizedBox(height: 16),
                _TypeCard(
                  icon: Icons.workspace_premium,
                  title: l10n.vipTitle,
                  desc: l10n.vipAdDesc,
                  gold: true,
                  onTap: () => context.go('/vip-buy'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final bool gold;
  final VoidCallback onTap;
  const _TypeCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.gold,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: gold ? AppColors.vipGold : AppColors.blockBorder,
            width: gold ? 2 : 1,
          ),
          boxShadow: gold
              ? [
            BoxShadow(
                color: AppColors.vipGold.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 1)
          ]
              : null,
        ),
        child: Row(
          children: [
            Icon(icon,
                color: gold ? AppColors.vipGold : AppColors.textSecondary,
                size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(desc,
                      style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          height: 1.4)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}