import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user_model.dart';

class SupabaseAuthDataSource {
  SupabaseAuthDataSource();

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw Exception('Sign in failed: No user data returned');
      }

      return UserModel(
        id: user.id,
        email: user.email ?? email,
        name: user.userMetadata?['name'],
        phone: user.phone,
        profileImageUrl: user.userMetadata?['profile_image_url'],
        createdAt: user.createdAt != null
            ? DateTime.parse(user.createdAt!)
            : null,
      );
    } on AuthException catch (e) {
      throw Exception('Authentication failed: ${e.message}');
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw Exception('Sign up failed: No user data returned');
      }

      return UserModel(
        id: user.id,
        email: user.email ?? email,
        name: user.userMetadata?['name'],
        phone: user.phone,
        profileImageUrl: user.userMetadata?['profile_image_url'],
        createdAt: user.createdAt != null
            ? DateTime.parse(user.createdAt!)
            : null,
      );
    } on AuthException catch (e) {
      throw Exception('Authentication failed: ${e.message}');
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } on AuthException catch (e) {
      throw Exception('Sign out failed: ${e.message}');
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null) {
        return null;
      }

      return UserModel(
        id: user.id,
        email: user.email ?? '',
        name: user.userMetadata?['name'],
        phone: user.phone,
        profileImageUrl: user.userMetadata?['profile_image_url'],
        createdAt: user.createdAt != null
            ? DateTime.parse(user.createdAt!)
            : null,
      );
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }
}
