import 'package:clean_architecture_riverpod/shared/data/local/storage_service.dart';
import 'package:clean_architecture_riverpod/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:clean_architecture_riverpod/shared/globals.dart';
import 'package:clean_architecture_riverpod/shared/theme/app_colors.dart';
import 'package:clean_architecture_riverpod/shared/theme/text_styles.dart';
import 'package:clean_architecture_riverpod/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeModeNotifier, ThemeMode>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return AppThemeModeNotifier(storageService);
});

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentThemeMode = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light);

  void toggleThemeMode() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentThemeMode() async {
    final themeMode = await storageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${themeMode ?? 'system'}');
    state = value;
  }
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: AppTextStyles.fontFamily,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.lightGrey,
          error: AppColors.error,
          surface: AppColors.black,
        ),
        // backgroundColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: TextThemes.darkTextTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.black,
          titleTextStyle: AppTextStyles.h2,
        ),
      );
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        textTheme: TextThemes.textTheme,
        primaryTextTheme: TextThemes.primaryTextTheme,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.lightGrey,
          error: AppColors.error,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
      );
}
