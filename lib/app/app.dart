import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdi/core/theme/app_theme.dart';
import 'package:wirdi/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wirdi/core/services/locale/locale_provider.dart';

class WirdiApp extends ConsumerStatefulWidget {
  const WirdiApp({super.key});

  @override
  ConsumerState<WirdiApp> createState() => _WirdiAppState();
}

class _WirdiAppState extends ConsumerState<WirdiApp> {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard mobile design size
      builder: (_, child) {
        return MaterialApp(
          title: 'Wirdi',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          locale: locale,
          supportedLocales: const [Locale('ar'), Locale('en')],
          localizationsDelegates: const [
            // Add your delegates here
          ],
          home: const DashboardPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
