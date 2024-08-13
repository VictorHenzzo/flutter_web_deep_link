import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_page_route.dart';

abstract class AppRouter {
  const AppRouter();

  static const String initialRoute = '';

  static final Map<String, AppPageRoute> _routes = {};

  static Route<dynamic>? onGenerateRoute(final RouteSettings settings) {
    return _routes[settings.name]!.buildRoute(settings.arguments);
  }
}
