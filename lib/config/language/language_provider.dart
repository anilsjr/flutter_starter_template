import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/storage_service.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  static const String _localeKey = 'selected_locale';

  void _loadLocale() {
    final languageCode = StorageService.getValue(_localeKey, defaultValue: 'en');
    state = Locale(languageCode);
  }

  void setLocale(Locale locale) {
    state = locale;
    StorageService.setValue(_localeKey, locale.languageCode);
  }
}
