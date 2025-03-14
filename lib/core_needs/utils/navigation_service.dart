import 'package:flutter/material.dart';
import '../variables/global_variables.dart';

sealed class NavigationService {

  /// Push a new page onto the navigation stack
  static Future<void> push(Widget page) async {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Push a new page and replace the current one
  static Future<void> pushReplacement(Widget page) async {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Push a new page and remove all previous routes
  static Future<void> pushAndRemoveUntil(Widget page) async {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
          (route) => false,
    );
  }

  /// Pop the current route (go back)
  static void pop() {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop();
    }
  }

  /// Pop multiple times until a specific route is found
  static void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Push a named route
  static Future<void> pushNamed(String routeName, {Object? arguments}) async {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  /// Push a named route and replace the current one
  static Future<void> pushReplacementNamed(String routeName, {Object? arguments}) async {
    navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Push a named route and remove all previous routes
  static Future<void> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  /// Push a page with a custom transition
  static Future<void> pushWithTransition(Widget page, RouteTransitionsBuilder transition) async {
    navigatorKey.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: transition,
      ),
    );
  }
}
