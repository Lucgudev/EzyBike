import 'package:flutter/material.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_detail/bike_detail_page.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/bike_rent_page.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent_success/bike_rent_success_page.dart';
import 'package:sample_bike_customer_app/presentation/page/home/home_page.dart';
import 'package:sample_bike_customer_app/presentation/page/login/login_page.dart';
import 'package:sample_bike_customer_app/presentation/page/notification/notification_page.dart';
import 'package:sample_bike_customer_app/presentation/page/register/register_page.dart';
import 'package:sample_bike_customer_app/presentation/page/root/root_page.dart';

class Router {
  static Map<String, Widget Function(BuildContext context)> generateRoute() {
    return {
      Routes.rootPage: (context) => const RootPage(),
      Routes.loginPage: (context) => const LoginPage(),
      Routes.registerPage: (context) => const RegisterPage(),
      Routes.homePage: (context) => const HomePage(),
      Routes.bikeDetailPage: (context) => const BikeDetailPage(),
      Routes.bikeRentPage: (context) => const BikeRentPage(),
      Routes.bikeRentSuccessPage: (context) => const BikeRentSuccessPage(),
      Routes.notificationPage: (context) => const NotificationPage(),
    };
  }
}
