import 'package:flutter/material.dart';

/// Reusable error state widget that displays a consistent error UI across the app
class ErrorStateWidget extends StatelessWidget {
  /// The main error title/message
  final String title;

  /// The detailed error message (usually from exception)
  final String errorMessage;

  /// Optional retry callback - if provided, shows retry button
  final VoidCallback? onRetry;

  /// Optional retry button label - defaults to "Retry"
  final String? retryLabel;

  /// Icon size - defaults to 60
  final double iconSize;

  /// Icon color - defaults to Colors.red
  final Color iconColor;

  const ErrorStateWidget({
    super.key,
    required this.title,
    required this.errorMessage,
    this.onRetry,
    this.retryLabel,
    this.iconSize = 60,
    this.iconColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: iconSize,
              color: iconColor,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(retryLabel ?? 'Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
