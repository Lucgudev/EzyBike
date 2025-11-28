import 'package:flutter/material.dart';

abstract class AppNavigator {
  void popUntil(String route);

  void popWithResult({Object? result});

  Future<Object?> pushNamedWithResult(String route, {Object? arguments});

  Future<Object?> pushReplacementNamedWithResult(String route,
      {Object? arguments});

  Future<Object?> pushNamedAndRemoveUntilWithResult(
    String newRouteName,
    bool Function(Route) predicate, {
    Object? arguments,
  });

  String currentRoute();

  Object? currentArguments();

  BuildContext? getContext();
}