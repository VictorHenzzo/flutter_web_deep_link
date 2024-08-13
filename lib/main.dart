import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_navigator.dart';
import 'package:web_deep_link/core/navigation/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _getTheme(),
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onGenerateInitialRoutes: AppRouter.onGenerateInitialRoutes,
    );
  }

  ThemeData _getTheme() {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          backgroundColor: WidgetStateColor.resolveWith((final states) {
            return colorScheme.primary;
          }),
          foregroundColor: WidgetStateColor.resolveWith((final states) {
            return colorScheme.surface;
          }),
          maximumSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        filled: true,
        prefixIconColor: colorScheme.outline,
        suffixIconColor: colorScheme.primary,
        fillColor: Colors.transparent,
      ),
    );
  }
}
