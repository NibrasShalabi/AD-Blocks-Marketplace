import 'package:equatable/equatable.dart';

/// بلوك VIP — حجم وموضع حر، وأولوية رقمية = المبلغ المدفوع.
class VipBlockModel extends Equatable {
  final String id;
  final int priority;       // المبلغ المدفوع — الترتيب تنازلي حسبه
  final double x;           // الموضع الأفقي
  final double y;           // الموضع العمودي
  final double width;       // العرض
  final double height;      // الارتفاع
  final String template;    // القالب/الشكل المختار (gold-frame, glow...)
  final String title;       // عنوان الإعلان
  final String description; // الوصف (يظهر بنافذة)
  final String imageUrl;
  final String linkUrl;
  final DateTime createdAt; // لشارة "جديد" والترتيب عند التساوي

  const VipBlockModel({
    required this.id,
    required this.priority,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.template,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.linkUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    priority,
    x,
    y,
    width,
    height,
    template,
    title,
    description,
    imageUrl,
    linkUrl,
    createdAt,
  ];
}