import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wirdi/app/app.dart';
import 'package:wirdi/core/services/di/injection.dart';
import 'package:wirdi/core/services/storage/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1. Initialize Hive
  await Hive.initFlutter();
  // 2. Register adapters and open boxes
  await HiveService.init();
  // 3. Setup Dependency Injection
  await setupLocator();
  
  runApp(
    const ProviderScope(
      child: WirdiApp(),
    ),
  );
}
