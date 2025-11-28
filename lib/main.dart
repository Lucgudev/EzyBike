import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'main_initializer.dart';

void main() async {
  final container = await _mainInitializer();
  runApp(
    ProviderScope(
      parent: container,
      child: SampleBikeCustomerApp(),
    ),
  );
}
