import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';

/// نافذة بلاغ عن إعلان. (الحفظ الفعلي بـtickets — مرحلة المنطق)
Future<void> showReportDialog(BuildContext context, {String? blockRef}) {
  final l10n = AppLocalizations.of(context)!;
  final ctrl = TextEditingController();
  return showDialog(
  context: context,
  builder: (ctx) => Dialog(
    child: Container(
      width: 500, // العرض المطلوب
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // العنوان (Row)
          Row(
            children: [
              const Icon(Icons.flag_outlined, color: AppColors.danger, size: 20),
              const SizedBox(width: 8),
              Text(l10n.reportTitle),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: ctrl,
            maxLines: 3,
            maxLength: 300,
            decoration: const InputDecoration(
              hintText: 'سبب البلاغ',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(l10n.cancel),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.reportSent)),
                  );
                },
                child: Text(l10n.send),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
  );
}