import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      saveLocale: true,

      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MemarDegla(),
      ),
    ),
  );

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: const [Locale('en'), Locale('ar')],
  //     path: 'assets/translation',
  //     fallbackLocale: const Locale('en'),
  //     saveLocale: true,

  //     child: const MemarDegla(),
  //   ),
  // );
}

class MemarDegla extends StatelessWidget {
  const MemarDegla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: AppTheme.light,

      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
