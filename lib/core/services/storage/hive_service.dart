import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String settingsBoxName = 'settings_box';
  
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(settingsBoxName);
  }

  Box get settingsBox => Hive.box(settingsBoxName);

  Box getBox(String name) => Hive.box(name);
}
