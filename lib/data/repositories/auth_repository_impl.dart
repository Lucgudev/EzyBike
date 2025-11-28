import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/supabase_auth.dart';
import '../models/user_model.dart';

part 'auth_repository_impl.g.dart';

@riverpod
SupabaseAuthDataSource supabaseAuthDataSource(Ref ref) {
  return SupabaseAuthDataSource();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(supabaseAuthDataSourceProvider));
}

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    return await _authDataSource.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    return await _authDataSource.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _authDataSource.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return await _authDataSource.getCurrentUser();
  }
}
