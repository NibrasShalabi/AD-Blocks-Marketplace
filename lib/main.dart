import 'package:ad_blocks_site/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
void main() {
  usePathUrlStrategy();

  runApp(const AdBlocksApp());
}

class AdBlocksApp extends StatelessWidget {
  const AdBlocksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,

      // دعم اللغتين
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // ما حطّينا locale ثابتة → Flutter بياخد لغة الجهاز تلقائياً،
      // ولو لغة الجهاز مش مدعومة بيرجع لأول لغة بالقائمة.
    );
  }
}