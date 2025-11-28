import 'package:flutter/material.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/presentation/page/home/home_page.dart';
import 'package:sample_bike_customer_app/presentation/page/login/login_page.dart';
import 'package:sample_bike_customer_app/presentation/page/register/register_page.dart';
import 'package:sample_bike_customer_app/presentation/page/root/root_page.dart';

class Router {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {
      Routes.rootPage: (context) => const RootPage(),
      Routes.loginPage: (context) => const LoginPage(),
      Routes.registerPage: (context) => const RegisterPage(),
      Routes.homePage: (context) => const HomePage(),
    };
  }
}
