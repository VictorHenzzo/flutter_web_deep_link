import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_page_route.dart';
import 'package:web_deep_link/modules/first_page.dart';
import 'package:web_deep_link/modules/second_page.dart';
import 'package:web_deep_link/modules/third_screen.dart';

abstract class AppRouter {
  const AppRouter();

  static const String initialRoute = '/first-page';

  static final Map<String, AppPageRoute> _routes = {
    '/third-page': ThirdPageRoute(),
    '/second-page': SecondPageRoute(),
    '/first-page': FirstPageRoute(),
  };

  static Route<dynamic>? onGenerateRoute(final RouteSettings settings) {
    return _routes[settings.name]!.buildRoute(settings.arguments);
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
    final String initialRoute,
  ) {
    final route = _routes[initialRoute];

    return [route!.buildRoute(null)];
  }
}
