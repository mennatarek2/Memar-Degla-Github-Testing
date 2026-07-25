import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/services/service_locator.dart';
import 'package:memar_degla/core/themes/app_theme.dart';
import 'package:memar_degla/features/profile/presentation/manger/cubit/profile_picture_cubit.dart';
import 'package:memar_degla/features/settings/domain/entities/app_theme_mode.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_cubit.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initServiceLocator();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      saveLocale: true,

      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<ProfilePictureCubit>()),

            BlocProvider.value(value: sl<ThemeCubit>()),
          ],
          child: const MemarDegla(),
        ),
      ),
    ),
  );

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: const [Locale('en'), Locale('ar')],
  //     path: 'assets/translation',
  //     fallbackLocale: const Locale('en'),
  //     saveLocale: true,

  //     child: MultiBlocProvider(
  //       providers: [
  //         BlocProvider(create: (_) => sl<ProfilePictureCubit>()),

  //         BlocProvider.value(value: sl<ThemeCubit>()),
  //       ],
  //       child: const MemarDegla(),
  //     ),
  //   ),
  // );
}

class MemarDegla extends StatelessWidget {
  const MemarDegla({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, SettingsThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          darkTheme: AppTheme.dark,
          themeMode: themeState.mode == AppThemeMode.light
              ? ThemeMode.light
              : ThemeMode.dark,
          theme: AppTheme.light,
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
