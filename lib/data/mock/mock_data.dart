import 'dart:math';
import '../models/block_model.dart';
import '../models/vip_block_model.dart';
import '../models/category_model.dart';
import '../models/package_model.dart';
/// بيانات وهمية لعرض الواجهة قبل ربط Firebase.
class MockData {
  // الفئات الثلاثة (واسعة، مش منتجات)
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'accounts',
      title: 'حسابات وصفحات',
      iconName: 'person',
      totalBlocks: 500,
    ),
    CategoryModel(
      id: 'services',
      title: 'خدمات',
      iconName: 'work',
      totalBlocks: 500,
    ),
    CategoryModel(
      id: 'creative',
      title: 'أعمال إبداعية',
      iconName: 'brush',
      totalBlocks: 500,
    ),
  ];
  // باقات البلوكات (سعر الوحدة ينزل كل ما الباقة تكبر)
  static const List<PackageModel> packages = [
    PackageModel(blocks: 1, price: 1.5),
    PackageModel(blocks: 5, price: 5.0),
    PackageModel(blocks: 20, price: 18.0, isBest: true),
    PackageModel(blocks: 50, price: 40.0),
  ];

  // قوالب الـVIP الجاهزة (id + اسم معروض + سعر إضافي)
  static const List<Map<String, dynamic>> vipTemplates = [
    {'id': 'gold-frame', 'name': 'إطار ذهبي', 'price': 5.0},
    {'id': 'glow', 'name': 'توهّج', 'price': 3.0},
    {'id': 'simple', 'name': 'بسيط', 'price': 1.0},
  ];

  /// يولّد بلوكات فئة: بعضها منشور (فيه صورة) وبعضها فاضي.
  static List<BlockModel> blocksFor(String categoryId) {
    final rnd = Random(categoryId.hashCode);
    final category = categories.firstWhere((c) => c.id == categoryId);
    const sampleTitles = [
      'حساب إنستا للبيع',
      'خدمة تصميم',
      'بورتفوليو مبرمج',
      'قناة تيليجرام',
      'متجر إلكتروني',
      'صفحة فيسبوك',
    ];
    return List.generate(category.totalBlocks, (i) {
      final filled = rnd.nextDouble() < 0.45;
      return BlockModel(
        index: i,
        status: filled ? BlockStatus.published : BlockStatus.empty,
        title: filled ? sampleTitles[i % sampleTitles.length] : null,
        imageUrl:
        filled ? 'https://picsum.photos/seed/${categoryId}_$i/200' : null,
        linkUrl: filled ? 'https://example.com' : null,
        detailsId: filled ? 'detail_${categoryId}_$i' : null,
      );
    });
  }

  /// بلوكات VIP بأولويات وأحجام مختلفة (الأعلى دفعاً أكبر وأهم).
  static List<VipBlockModel> vipBlocks() {
    final now = DateTime.now();
    return [
      VipBlockModel(
        id: 'vip1', priority: 1000,
        x: 0, y: 0, width: 280, height: 180,
        template: 'gold-frame',
        title: 'إعلان مميز ذهبي',
        description:
        'وصف تفصيلي للإعلان المميز. ممكن يكون طويل جداً ويشرح كل تفاصيل الخدمة أو المنتج بدون ما ياخد مساحة على البلوك، لأنه بيظهر بنافذة منفصلة عند الضغط.',
        imageUrl: 'https://picsum.photos/seed/vip1/400/300',
        linkUrl: 'https://example.com',
        createdAt: now.subtract(const Duration(hours: 3)),
      ),
      VipBlockModel(
        id: 'vip2', priority: 500,
        x: 290, y: 0, width: 180, height: 180,
        template: 'glow',
        title: 'خدمة احترافية',
        description:
        'شرح كامل للخدمة المقدمة وكل ما تتضمنه من مزايا وتفاصيل التواصل.',
        imageUrl: 'https://picsum.photos/seed/vip2/300/300',
        linkUrl: 'https://example.com',
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      VipBlockModel(
        id: 'vip3', priority: 250,
        x: 480, y: 0, width: 140, height: 180,
        template: 'gold-frame',
        title: 'عرض خاص',
        description: 'تفاصيل العرض الخاص وشروطه ومدة صلاحيته.',
        imageUrl: 'https://picsum.photos/seed/vip3/250/300',
        linkUrl: 'https://example.com',
        createdAt: now.subtract(const Duration(hours: 10)),
      ),
      VipBlockModel(
        id: 'vip4', priority: 100,
        x: 0, y: 190, width: 140, height: 120,
        template: 'simple',
        title: 'إعلان عادي',
        description: 'وصف مختصر لهذا الإعلان.',
        imageUrl: 'https://picsum.photos/seed/vip4/250/200',
        linkUrl: 'https://example.com',
        createdAt: now.subtract(const Duration(days: 5)),
      ),
      VipBlockModel(
        id: 'vip5', priority: 50,
        x: 150, y: 190, width: 140, height: 120,
        template: 'simple',
        title: 'إعلان بسيط',
        description: 'معلومات إضافية عن الإعلان تظهر هنا عند الضغط.',
        imageUrl: 'https://picsum.photos/seed/vip5/250/200',
        linkUrl: 'https://example.com',
        createdAt: now.subtract(const Duration(days: 1)),
      ),
    ];
  }
}