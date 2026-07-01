import 'package:equatable/equatable.dart';

/// حالة البلوك العادي.
enum BlockStatus { empty, published }

/// بلوك عادي في صفحة فئة.
class BlockModel extends Equatable {
  final int index;
  final BlockStatus status;
  final String? title;      // عنوان الإعلان (جديد)
  final String? imageUrl;
  final String? linkUrl;
  final String? detailsId;

  const BlockModel({
    required this.index,
    required this.status,
    this.title,
    this.imageUrl,
    this.linkUrl,
    this.detailsId,
  });

  bool get isEmpty => status == BlockStatus.empty;

  @override
  List<Object?> get props =>
      [index, status, title, imageUrl, linkUrl, detailsId];
}