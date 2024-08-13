import 'package:flutter/material.dart' as material;

abstract class AppNavigator {
  const AppNavigator();

  static final material.GlobalKey<material.NavigatorState> navigatorKey =
      material.GlobalKey<material.NavigatorState>();

  static Future<T?> pushNamed<T>(
    final String route, {
    final Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  static void pop<T>({
    final Object? result,
  }) {
    navigatorKey.currentState!.pop(result);
  }

  static Future<T?> popAndPushNamed<T>(
    final String route, {
    final Object? arguments,
    Object? result,
  }) {
    return navigatorKey.currentState!
        .popAndPushNamed(route, arguments: arguments, result: result);
  }

  static void popUntil<T>(
    bool Function(material.Route<dynamic>) predicate,
  ) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  static Future<T?> pushNamedAndRemoveUntil<T>(
    String newRouteName,
    bool Function(material.Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T>(
    final String route, {
    final Object? arguments,
    Object? result,
  }) {
    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments, result: result);
  }
}
