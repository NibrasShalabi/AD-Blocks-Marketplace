import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..load(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    super.initState();
    // toast عند الفتح: أحدث إعلان VIP
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final latest = context.read<HomeCubit>().state.latestVip;
      if (latest != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.star, color: AppColors.vipGold, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.vipToast,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.surface,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.vipGold, width: 1),
            ),
            duration: const Duration(seconds: 4),
            action: SnackBarAction(
              label: AppLocalizations.of(context)!.see,
              textColor: AppColors.vipGold,
              onPressed: () => context.go('/vip'),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // زر الـVIP البارز (above the fold)
                _VipBanner(onTap: () => context.go('/vip')),
                const SizedBox(height: 28),
                Text(l10n.categories,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ...state.categories.map(
                      (c) => Card(
                    color: AppColors.surface,
                    child: ListTile(
                      title: Text(c.title),
                      subtitle: Text('${c.totalBlocks} ${l10n.slot}'),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () => context.go('/category/${c.id}'),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(color: AppColors.blockBorder),
                const SizedBox(height: 12),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: [
                    TextButton(
                      onPressed: () => context.go('/terms'),
                      child: Text(l10n.footerTerms),
                    ),
                    TextButton(
                      onPressed: () => context.go('/privacy'),
                      child: Text(l10n.footerPrivacy),
                    ),
                    TextButton(
                      onPressed: () => context.go('/contact'),
                      child: Text(l10n.footerContact),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/choose'),
        backgroundColor: AppColors.vipGold,
        icon: const Icon(Icons.add, color: Colors.black),
        label: Text(
          l10n.uploadTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class _VipBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _VipBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.vipGold, width: 2),
          boxShadow: [
            BoxShadow(
                color: AppColors.vipGlow, blurRadius: 20, spreadRadius: 2),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.star, color: AppColors.vipGold, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.vipAds,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(l10n.vipSubtitle,
                      style: const TextStyle(
                          color: AppColors.textSecondary, fontSize: 13)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left, color: AppColors.vipGold),
          ],
        ),
      ),
    );
  }
}