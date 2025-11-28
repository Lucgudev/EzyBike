import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/router/router.dart';

import 'core/provider/global_provider.dart';
import 'core/router/routes.dart';

class SampleBikeCustomerApp extends ConsumerStatefulWidget {
  const SampleBikeCustomerApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SampleBikeCustomerAppState();
}

class _SampleBikeCustomerAppState extends ConsumerState<SampleBikeCustomerApp> {
  GlobalKey<NavigatorState>? _navigatorKey;

  @override
  void initState() {
    super.initState();
    _navigatorKey = ref.read(navigatorKeyProvider);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Bike Customer App',
      navigatorKey: _navigatorKey,
      routes: Router.generateRoute(),
      initialRoute: Routes.rootPage,
    );
  }
}
