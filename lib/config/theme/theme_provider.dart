import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/storage_service.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  void _loadThemeMode() {
    final themeIndex = StorageService.getValue(_themeModeKey, defaultValue: ThemeMode.system.index);
    state = ThemeMode.values[themeIndex];
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    StorageService.setValue(_themeModeKey, mode.index);
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
}
