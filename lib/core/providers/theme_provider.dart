import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/storage/hive_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final box = Hive.box(HiveService.settingsBoxName);
    final savedTheme = box.get('theme_mode', defaultValue: 'system');
    if (savedTheme == 'dark') {
      state = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final box = Hive.box(HiveService.settingsBoxName);
    String val = 'system';
    if (mode == ThemeMode.dark) val = 'dark';
    if (mode == ThemeMode.light) val = 'light';
    await box.put('theme_mode', val);
  }
}
