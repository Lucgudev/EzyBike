import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_bike_customer_app/core/provider/global_provider.dart';
import 'app_navigator.dart';

part 'app_navigator_impl.g.dart';

@riverpod
AppNavigator appNavigator(Ref ref) {
  return AppNavigatorImpl(navigatorKey: ref.read(navigatorKeyProvider));
}

class AppNavigatorImpl implements AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey;

  AppNavigatorImpl({required this.navigatorKey});

  NavigatorState? get _navigator => navigatorKey.currentState;

  @override
  void popUntil(String route) {
    _navigator?.popUntil(ModalRoute.withName(route));
  }

  @override
  void popWithResult({Object? result}) {
    _navigator?.pop(result);
  }

  @override
  Future<Object?> pushNamedWithResult(String route, {Object? arguments}) {
    return _navigator?.pushNamed(route, arguments: arguments) ??
        Future.value(null);
  }

  @override
  Future<Object?> pushReplacementNamedWithResult(
    String route, {
    Object? arguments,
  }) {
    return _navigator?.pushReplacementNamed(route, arguments: arguments) ??
        Future.value(null);
  }

  @override
  Future<Object?> pushNamedAndRemoveUntilWithResult(
    String newRouteName,
    bool Function(Route) predicate, {
    Object? arguments,
  }) {
    return _navigator?.pushNamedAndRemoveUntil(
          newRouteName,
          predicate,
          arguments: arguments,
        ) ??
        Future.value(null);
  }

  @override
  String currentRoute() {
    final route = ModalRoute.of(
      _navigator?.context ?? navigatorKey.currentContext!,
    );
    return route?.settings.name ?? '';
  }

  @override
  Object? currentArguments() {
    final route = ModalRoute.of(
      _navigator?.context ?? navigatorKey.currentContext!,
    );
    return route?.settings.arguments;
  }

  @override
  BuildContext? getContext() {
    return navigatorKey.currentContext;
  }
}
