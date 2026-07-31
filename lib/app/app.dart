// lib/app/app.dart (Simplified working version)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdi/core/theme/app_theme.dart';
import 'package:wirdi/core/providers/locale_provider.dart';
import 'package:wirdi/core/providers/theme_provider.dart';
import 'package:wirdi/features/home/presentation/pages/home_page.dart';

class WirdiApp extends ConsumerWidget {
  const WirdiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Wirdi',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          locale: locale,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
