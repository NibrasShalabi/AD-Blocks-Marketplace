import 'package:equatable/equatable.dart';

/// فئة (صفحة) — واسعة، مش بس منتجات.
class CategoryModel extends Equatable {
  final String id;          // معرّف الفئة (للمسار: /category/services)
  final String title;       // الاسم المعروض
  final String iconName;    // اسم أيقونة تمثيلية (اختياري)
  final int totalBlocks;    // إجمالي البلوكات بالصفحة

  const CategoryModel({
    required this.id,
    required this.title,
    required this.iconName,
    required this.totalBlocks,
  });

  @override
  List<Object?> get props => [id, title, iconName, totalBlocks];
}