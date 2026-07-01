import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/mock/mock_data.dart';
import '../../../data/models/package_model.dart';
import '../../../l10n/app_localizations.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  PackageModel? _selectedPackage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.go('/'),
        ),
        title: Text(l10n.choosePackage),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...MockData.packages.map((p) => _PackageCard(
                  package: p,
                  selected: _selectedPackage == p,
                  onTap: () => setState(() => _selectedPackage = p),
                )),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${l10n.total}: \$${(_selectedPackage?.price ?? 0).toStringAsFixed(1)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    FilledButton(
                      onPressed: _selectedPackage == null
                          ? null
                          : () => context.go('/upload', extra: {
                        'summary':
                        '${_selectedPackage!.blocks} ${l10n.blocks}',
                        'amount': _selectedPackage!.price,
                      }
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text(l10n.continueBtn),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final PackageModel package;
  final bool selected;
  final VoidCallback onTap;

  const _PackageCard({
    required this.package,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.vipGold : AppColors.blockBorder,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${package.blocks} ${l10n.blocks}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      if (package.isBest) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.vipGold,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(l10n.bestValue,
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.vipGoldText,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${package.perUnit.toStringAsFixed(2)} ${l10n.perUnit}',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Text('\$${package.price.toStringAsFixed(1)}',
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}