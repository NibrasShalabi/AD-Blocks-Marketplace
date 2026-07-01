import 'package:go_router/go_router.dart';
import '../../presentation/contact/view/contact_page.dart';
import '../../presentation/home/view/home_page.dart';
import '../../presentation/category/view/category_page.dart';
import '../../presentation/privacy/view/privacy_page.dart';
import '../../presentation/vip/view/vip_page.dart';
import '../../presentation/upload/view/upload_page.dart';
import '../../presentation/packages/view/packages_page.dart';
import '../../presentation/vip_buy/view/vip_buy_page.dart';
import '../../presentation/choose/view/choose_type_page.dart';
import '../../presentation/terms/view/terms_page.dart';
import '../../presentation/payment/view/payment_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomePage()),
    GoRoute(path: '/vip', builder: (_, __) => const VipPage()),
    GoRoute(
      path: '/upload',
      builder: (_, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return UploadPage(
          summary: extra?['summary'] as String? ?? '',
          amount: extra?['amount'] as double? ?? 0,
        );
      },
    ),    GoRoute(path: '/choose', builder: (_, __) => const ChooseTypePage()),
    GoRoute(path: '/packages', builder: (_, __) => const PackagesPage()),
    GoRoute(path: '/vip-buy', builder: (_, __) => const VipBuyPage()),
    GoRoute(path: '/terms', builder: (_, __) => const TermsPage()),
    GoRoute(
      path: '/category/:id',
      builder: (_, state) =>
          CategoryPage(categoryId: state.pathParameters['id']!),
    ),
    GoRoute(path: '/privacy', builder: (_, __) => const PrivacyPage()),
    GoRoute(path: '/contact', builder: (_, __) => const ContactPage()),
    GoRoute(
      path: '/payment',
      builder: (_, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return PaymentPage(
          summary: extra?['summary'] as String? ?? '',
          amount: extra?['amount'] as double? ?? 0,
        );
      },
    ),
  ],
);