import 'package:supabase_flutter/supabase_flutter.dart';
import '../exceptions/user_friendly_exception.dart';

/// Generic error handler for Supabase operations
/// Converts technical Supabase errors into user-friendly messages
class SupabaseErrorHandler {
  /// Maps Supabase errors to user-friendly messages
  static String getUserFriendlyMessage(dynamic error) {
    // Handle Supabase AuthException
    if (error is AuthException) {
      return _handleAuthException(error);
    }

    // Handle Supabase PostgrestException (database errors)
    if (error is PostgrestException) {
      return _handlePostgrestException(error);
    }

    // Handle Supabase StorageException
    if (error is StorageException) {
      return _handleStorageException(error);
    }

    // Handle network-related errors
    final errorString = error.toString().toLowerCase();
    if (errorString.contains('socketexception') ||
        errorString.contains('failed host lookup')) {
      return 'Unable to connect to the server. Please check your internet connection.';
    }

    if (errorString.contains('timeoutexception') ||
        errorString.contains('timed out')) {
      return 'The request took too long. Please try again.';
    }

    // Generic error
    return 'Something went wrong. Please try again later.';
  }

  /// Handle authentication-specific errors
  static String _handleAuthException(AuthException error) {
    final message = error.message.toLowerCase();

    // Invalid credentials
    if (message.contains('invalid login credentials') ||
        message.contains('invalid email or password') ||
        message.contains('email not confirmed')) {
      return 'Invalid email or password. Please check your credentials.';
    }

    // Email verification
    if (message.contains('email not confirmed')) {
      return 'Please verify your email address before signing in.';
    }

    // User already exists
    if (message.contains('user already registered') ||
        message.contains('already exists') ||
        message.contains('already been registered')) {
      return 'An account with this email already exists. Please sign in instead.';
    }

    // Password requirements
    if (message.contains('password should be at least') ||
        message.contains('password is too weak')) {
      return 'Password is too weak. Please use at least 6 characters.';
    }

    // Invalid email format
    if (message.contains('invalid email') ||
        message.contains('unable to validate email address')) {
      return 'Please enter a valid email address.';
    }

    // Rate limiting
    if (message.contains('rate limit') ||
        message.contains('too many requests')) {
      return 'Too many attempts. Please wait a moment and try again.';
    }

    // User not found
    if (message.contains('user not found')) {
      return 'No account found with this email. Please sign up first.';
    }

    // Session expired
    if (message.contains('session') && message.contains('expired')) {
      return 'Your session has expired. Please sign in again.';
    }

    // Generic auth error
    return 'Authentication failed. Please try again.';
  }

  /// Handle database operation errors
  static String _handlePostgrestException(PostgrestException error) {
    final message = error.message.toLowerCase();
    final code = error.code?.toLowerCase() ?? '';

    // Permission errors
    if (message.contains('permission denied') ||
        message.contains('insufficient privilege') ||
        code.contains('42501')) {
      return 'You do not have permission to perform this action.';
    }

    // Not found errors
    if (message.contains('not found') || code.contains('pgrst116')) {
      return 'The requested data was not found.';
    }

    // Duplicate key errors
    if (message.contains('duplicate key') ||
        message.contains('unique constraint') ||
        code.contains('23505')) {
      return 'This record already exists. Please try a different value.';
    }

    // Foreign key violations
    if (message.contains('foreign key') || code.contains('23503')) {
      return 'This operation cannot be completed due to related data.';
    }

    // Data validation errors
    if (message.contains('invalid input') ||
        message.contains('check constraint') ||
        code.contains('23514')) {
      return 'Invalid data provided. Please check your input.';
    }

    // Not null constraint
    if (message.contains('null value') || code.contains('23502')) {
      return 'Required field is missing. Please fill in all required fields.';
    }

    // Connection errors
    if (message.contains('connection') || message.contains('network')) {
      return 'Unable to connect to the database. Please try again.';
    }

    // Generic database error
    return 'Unable to complete the operation. Please try again.';
  }

  /// Handle storage operation errors
  static String _handleStorageException(StorageException error) {
    final message = error.message.toLowerCase();

    // File not found
    if (message.contains('not found') || message.contains('object not found')) {
      return 'The requested file was not found.';
    }

    // Permission errors
    if (message.contains('permission') || message.contains('unauthorized')) {
      return 'You do not have permission to access this file.';
    }

    // File size errors
    if (message.contains('file size') ||
        message.contains('too large') ||
        message.contains('payload too large')) {
      return 'The file is too large. Please choose a smaller file.';
    }

    // Invalid file type
    if (message.contains('invalid file type') ||
        message.contains('file type not allowed')) {
      return 'This file type is not supported.';
    }

    // Storage quota
    if (message.contains('quota') || message.contains('storage limit')) {
      return 'Storage limit exceeded. Please free up some space.';
    }

    // Generic storage error
    return 'Unable to upload or access the file. Please try again.';
  }

  /// Wraps an exception with a user-friendly message
  static ErrorException toUserFriendlyException(dynamic error) {
    return ErrorException(getUserFriendlyMessage(error));
  }
}
