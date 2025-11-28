// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginPageViewModelHash() =>
    r'e350c3680122e9e83299a89691ddd791e26ce063';

/// See also [LoginPageViewModel].
@ProviderFor(LoginPageViewModel)
final loginPageViewModelProvider =
    AutoDisposeAsyncNotifierProvider<LoginPageViewModel, UserModel?>.internal(
      LoginPageViewModel.new,
      name: r'loginPageViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$loginPageViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginPageViewModel = AutoDisposeAsyncNotifier<UserModel?>;
String _$loginFormValidationHash() =>
    r'927a276781612fd8dfb8b84137659000edfbf39b';

/// See also [LoginFormValidation].
@ProviderFor(LoginFormValidation)
final loginFormValidationProvider =
    AutoDisposeNotifierProvider<LoginFormValidation, bool>.internal(
      LoginFormValidation.new,
      name: r'loginFormValidationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$loginFormValidationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginFormValidation = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
