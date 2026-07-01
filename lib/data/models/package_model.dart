import 'package:equatable/equatable.dart';

/// باقة بلوكات: عدد + سعر، وسعر الوحدة يُحسب تلقائياً.
class PackageModel extends Equatable {
  final int blocks;      // عدد البلوكات
  final double price;    // السعر الكلي بالدولار
  final bool isBest;     // شارة "الأوفر"

  const PackageModel({
    required this.blocks,
    required this.price,
    this.isBest = false,
  });

  double get perUnit => price / blocks; // سعر الوحدة (للتدرّج)

  @override
  List<Object?> get props => [blocks, price, isBest];
}