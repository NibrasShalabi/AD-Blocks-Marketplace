/// إعدادات الشبكة المركزية — مرجع واحد لكل الأبعاد والأرقام.
class GridConfig {
  // الشبكة العادية
  static const int normalColumns = 12;     // عدد الأعمدة (متصفّح)
  static const int normalColumnsMobile = 4; // عدد الأعمدة (جوال)
  static const double blockSize = 64;       // حجم البلوك الواحد (بكسل)
  static const double blockGap = 4;         // الفراغ بين البلوكات

  // الـVIP
  static const int goldenSlotsDesktop = 5;  // الخانات الذهبية (متصفّح)
  static const int goldenSlotsMobile = 2;   // الخانات الذهبية (جوال)

  // شارة "جديد": الإعلانات المضافة خلال آخر كم ساعة
  static const int newBadgeHours = 24;

  // نقطة التحوّل بين الجوال والمتصفّح
  static const double mobileBreakpoint = 600;
}