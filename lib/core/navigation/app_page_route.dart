import 'package:flutter/material.dart';

abstract class AppPageRoute<T extends Object?> {
  const AppPageRoute();

  PageRouteBuilder buildRoute(final T arguments) {
    return PageRouteBuilder(
      settings: RouteSettings(
        name: routePath,
        arguments: arguments,
      ),
      pageBuilder: (final context, final _, final __) {
        return buildPage(context, arguments);
      },
      transitionsBuilder: (final _, final animation, final __, final child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  Widget buildPage(final BuildContext context, final T arguments);

  String get routePath;
}
