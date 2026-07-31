import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wirdi/core/services/storage/hive_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }
  
  final Box settingsBox = HiveService().getBox(HiveService.settingsBox);
  
  Future<void> _loadTheme() async {
    final savedTheme = settingsBox.get('themeMode', defaultValue: 'system');
    state = _stringToThemeMode(savedTheme);
  }
  
  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    await settingsBox.put('themeMode', _themeModeToString(mode));
  }
  
  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
  
  ThemeMode _stringToThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
