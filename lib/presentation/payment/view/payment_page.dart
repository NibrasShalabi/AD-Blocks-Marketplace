import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class PaymentPage extends StatefulWidget {
  final String summary; // ملخص الطلب (يُمرّر من الشاشة السابقة)
  final double amount;
  const PaymentPage({super.key, required this.summary, required this.amount});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final terms = [
      l10n.termNoRefund,
      l10n.termContent,
      l10n.termLinkResp,
      l10n.termReview,
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.payTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ملخص الطلب
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.blockBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.orderSummary,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.summary,
                              style: const TextStyle(
                                  color: AppColors.textSecondary)),
                          Text('\$${widget.amount.toStringAsFixed(1)}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // التحذيرات (الشروط)
                ...terms.map((t) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline,
                          size: 18, color: AppColors.textSecondary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(t,
                            style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.5)),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 8),

                // الموافقة الإجبارية
                CheckboxListTile(
                  value: _agreed,
                  onChanged: (v) => setState(() => _agreed = v ?? false),
                  activeColor: AppColors.vipGold,
                  checkColor: AppColors.vipGoldText,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(l10n.agreeTerms,
                      style: const TextStyle(fontSize: 14)),
                ),
                TextButton(
                  onPressed: () => context.go('/terms'),
                  child: Text(l10n.readTerms),
                ),
                const SizedBox(height: 20),

                // زر الدفع (معطّل حتى الموافقة)
                FilledButton.icon(
                  onPressed: _agreed
                      ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.payViaKaza)),
                    );
                  }
                      : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.vipGold,
                    foregroundColor: AppColors.vipGoldText,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.account_balance_wallet_outlined),
                  label: Text(l10n.payViaKaza),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}