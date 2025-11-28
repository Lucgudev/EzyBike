import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/router/app_navigator_impl.dart';
import 'package:sample_bike_customer_app/data/models/user_model.dart';
import '../../../core/router/routes.dart';
import 'root_page_view_model.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({super.key});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(
      rootPageViewModelProvider,
      (previous, next) {
        next.when(
          data: (user) {
            if (user == null) {
              // No session, navigate to login
              ref
                  .read(appNavigatorProvider)
                  .pushReplacementNamedWithResult(Routes.loginPage);
            } else {
              // User has session, navigate to homepage
              ref
                  .read(appNavigatorProvider)
                  .pushReplacementNamedWithResult(Routes.homePage);
            }
          },
          loading: () {
            // Still loading, do nothing
          },
          error: (error, stackTrace) {
            // Error checking session, navigate to login
            ref
                .read(appNavigatorProvider)
                .pushReplacementNamedWithResult(Routes.loginPage);
          },
        );
      },
    );

    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}
