/// Centralized validation helper for common validation patterns
class ValidationHelper {
  ValidationHelper._();

  /// Email validation regex pattern
  /// Matches: username@domain.com, user.name@sub.domain.co.uk
  static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// Validates if the given email string matches the email pattern
  ///
  /// Returns `true` if the email is valid, `false` otherwise
  /// The email is trimmed before validation
  static bool isValidEmail(String email) {
    final trimmedEmail = email.trim();
    return trimmedEmail.isNotEmpty && _emailRegex.hasMatch(trimmedEmail);
  }

  /// Validates if the given password meets minimum requirements
  ///
  /// Returns `true` if password is at least [minLength] characters (default: 6)
  static bool isValidPassword(String password, {int minLength = 6}) {
    return password.isNotEmpty && password.length >= minLength;
  }
}
