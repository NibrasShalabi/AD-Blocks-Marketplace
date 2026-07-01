import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/block_model.dart';
import '../../l10n/app_localizations.dart';

/// بطاقة إعلان عادية: صورة + عنوان + زر زيارة + أيقونة إبلاغ.
class AdBlock extends StatelessWidget {
  final BlockModel block;
  final VoidCallback onVisit;
  final VoidCallback onReport;
  final VoidCallback onTapEmpty;

  const AdBlock({
    super.key,
    required this.block,
    required this.onVisit,
    required this.onReport,
    required this.onTapEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // خانة فاضية: مربع بسيط قابل للنقر
    if (block.isEmpty) {
      return GestureDetector(
        onTap: onTapEmpty,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blockEmpty,
            border: Border.all(color: AppColors.blockBorder, width: 0.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Icon(Icons.add, size: 18, color: AppColors.textSecondary),
          ),
        ),
      );
    }

    // بطاقة منشورة
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.blockBorder, width: 0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // الصورة
          Expanded(
            child: CachedNetworkImage(
              imageUrl: block.imageUrl!,
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  Container(color: AppColors.surfaceLight),
              errorWidget: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 16),
            ),
          ),
          // العنوان
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Text(
              block.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // صف الأزرار: زيارة + إبلاغ
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onVisit,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    minimumSize: const Size(0, 28),
                  ),
                  child: Text(l10n.visit, style: const TextStyle(fontSize: 12)),
                ),
              ),
              IconButton(
                onPressed: onReport,
                icon: const Icon(Icons.flag_outlined, size: 16),
                color: AppColors.textSecondary,
                tooltip: l10n.report,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }
}