import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/services/storage/hive_service.dart';
import 'features/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const ProviderScope(child: WirdiApp()));
}

Future<void> setupLocator() async {
  await HiveService.init();
}

class WirdiApp extends ConsumerWidget {
  const WirdiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Wirdi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
