import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/grid_config.dart';
import '../../data/models/vip_block_model.dart';
import '../../l10n/app_localizations.dart';
import 'new_badge.dart';

/// بطاقة VIP فاخرة: تدرّج + حافة ذهبية + عنوان + زيارة/إبلاغ، ونقرة تفتح التفاصيل.
class VipBlock extends StatelessWidget {
  final VipBlockModel block;
  final VoidCallback onReport;

  const VipBlock({super.key, required this.block, required this.onReport});

  bool get _isNew {
    final hours = DateTime.now().difference(block.createdAt).inHours;
    return hours.compareTo(GridConfig.newBadgeHours).isNegative;
  }

  bool get _isGold => block.template == 'gold-frame';

  void _openDetails(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 460),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.cardGradTop, AppColors.cardGradBottom],
            ),
            border: Border.all(
              color: AppColors.vipGold.withValues(alpha: 0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // الصورة
              SizedBox(
                height: 160,
                child: CachedNetworkImage(
                  imageUrl: block.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                  const _GradientPlaceholder(),
                  errorWidget: (_, __, ___) => const _GradientPlaceholder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (_isGold)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.workspace_premium,
                                color: AppColors.vipGold, size: 20),
                          ),
                        Expanded(
                          child: Text(
                            block.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // الوصف الكامل (قابل للسكرول لو طويل)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Text(
                          block.description,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {
                              // لاحقاً: فتح block.linkUrl بتبويب جديد (noopener)
                              Navigator.of(context).pop();
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.vipGold,
                              foregroundColor: AppColors.vipGoldText,
                            ),
                            icon: const Icon(Icons.open_in_new, size: 16),
                            label: Text(l10n.visit),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(l10n.close),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => _openDetails(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.cardGradTop, AppColors.cardGradBottom],
          ),
          border: Border.all(
            color: _isGold ? AppColors.vipGold : AppColors.blockBorder,
            width: _isGold ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isGold
                  ? AppColors.vipGold.withValues(alpha: 0.35)
                  : Colors.black.withValues(alpha: 0.4),
              blurRadius: _isGold ? 24 : 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // الصورة (فوق التدرّج — لو ما حمّلت يبقى التدرّج ظاهر)
            CachedNetworkImage(
              imageUrl: block.imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const SizedBox.shrink(),
              errorWidget: (_, __, ___) => const SizedBox.shrink(),
            ),

            // تاج ذهبي
            if (_isGold)
              const Positioned(
                top: 8,
                left: 8,
                child: Icon(Icons.workspace_premium,
                    color: AppColors.vipGold, size: 18),
              ),

            // شارة "جديد"
            if (_isNew) const Positioned(top: 8, right: 8, child: NewBadge()),

            // الشريط السفلي: تدرّج + عنوان + أزرار
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      block.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: _isGold
                                  ? AppColors.vipGold
                                  : Colors.white.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.open_in_new,
                                    size: 13,
                                    color: _isGold
                                        ? AppColors.vipGoldText
                                        : Colors.white),
                                const SizedBox(width: 4),
                                Text(
                                  l10n.visit,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _isGold
                                        ? AppColors.vipGoldText
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: onReport,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(Icons.flag_outlined,
                                size: 14, color: Color(0xFFC9CEDA)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// خلفية متدرّجة تظهر مكان الصورة لو ما حمّلت.
class _GradientPlaceholder extends StatelessWidget {
  const _GradientPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.surfaceLight, AppColors.cardGradBottom],
        ),
      ),
      child: const Center(
        child: Icon(Icons.image_outlined, color: Color(0xFF4A5578), size: 32),
      ),
    );
  }
}