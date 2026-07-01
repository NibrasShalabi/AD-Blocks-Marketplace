import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/mock/mock_data.dart';
import '../../../l10n/app_localizations.dart';

class VipBuyPage extends StatefulWidget {
  const VipBuyPage({super.key});

  @override
  State<VipBuyPage> createState() => _VipBuyPageState();
}

class _VipBuyPageState extends State<VipBuyPage> {
  static const double minAmount = 50;
  final _amountCtrl = TextEditingController(text: '50');
  String _selectedTemplate = 'gold-frame';

  double get _amount => double.tryParse(_amountCtrl.text) ?? 0;
  bool get _valid => _amount >= minAmount;

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            const Icon(Icons.workspace_premium,
                color: AppColors.vipGold, size: 20),
            const SizedBox(width: 8),
            Text(l10n.vipTitle),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // المبلغ الحر
                Text(l10n.vipAmountLabel,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextField(
                  controller: _amountCtrl,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    border: const OutlineInputBorder(),
                    errorText: _valid ? null : l10n.vipBelowMin,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.trending_up,
                        size: 16, color: AppColors.vipGold),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(l10n.vipMinNote,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // اختيار القالب (شكل بصري)
                Text(l10n.chooseTemplate,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: MockData.vipTemplates.map((tpl) {
                    final id = tpl['id'] as String;
                    final selected = _selectedTemplate == id;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedTemplate = id),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selected
                                ? AppColors.vipGold
                                : AppColors.blockBorder,
                            width: selected ? 2 : 1,
                          ),
                        ),
                        child: Text(tpl['name'] as String,
                            style: const TextStyle(fontSize: 13)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),

                // الإجمالي + متابعة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${l10n.total}: \$${_amount.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    FilledButton(
                      onPressed: _valid
                          ? () => context.go('/upload', extra: {
                        'summary': l10n.vipTitle,
                        'amount': _amount,
                      })
                          : null,
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