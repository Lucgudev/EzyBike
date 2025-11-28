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
    url: 'https://rmauucevbyzvxhfyyvck.supabase.co',
    anonKey: 'sb_publishable_XeRxBj1N_XXV1Y_vuKqJog_a0c8mKxu',
  );
}
