part of 'main.dart';

Future<ProviderContainer> _mainInitializer() async {
  await _setupSupabase();
  final container = ProviderContainer(
    overrides: [],
  );
  return container;
}

Future<void> _setupSupabase() async {
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );
}
