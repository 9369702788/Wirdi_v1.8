// lib/core/services/storage/hive_service.dart (Simplified working version)
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String settingsBox = 'settings_box';
  
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(settingsBox);
  }
  
  Box get settingsBox => Hive.box(settingsBox);
}
