import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/exceptions/user_friendly_exception.dart';
import '../../../core/helper/supabase_error_handler.dart';
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
        throw ErrorException('Unable to sign in. Please try again.');
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
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
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
        throw ErrorException('Unable to create account. Please try again.');
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
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
    }
  }

  Future<void> signOut() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } catch (e) {
      throw SupabaseErrorHandler.toUserFriendlyException(e);
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
      throw SupabaseErrorHandler.toUserFriendlyException(e);
    }
  }
}
