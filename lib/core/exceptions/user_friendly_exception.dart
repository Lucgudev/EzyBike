/// Custom exception that displays user-friendly error messages
///
/// Unlike the standard Exception class which prepends "Exception: " to the message,
/// this class returns the message directly when toString() is called.
class ErrorException implements Exception {
  final String message;

  ErrorException(this.message);

  @override
  String toString() => message;
}
