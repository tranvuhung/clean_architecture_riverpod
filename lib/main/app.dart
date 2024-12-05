import 'package:clean_architecture_riverpod/features/authentication/presentation/screens/login_screen.dart';
import 'package:clean_architecture_riverpod/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return MaterialApp(
      title: 'Clean Architecture Riverpod',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
