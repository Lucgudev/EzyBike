import 'package:flutter/material.dart';

class StockBadgeWidget extends StatelessWidget {
  final int stock;

  const StockBadgeWidget({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: stock <= 0
            ? Colors.red.withOpacity(0.1)
            : stock < 10
                ? Colors.orange.withOpacity(0.1)
                : Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        stock <= 0
            ? 'Out of Stock'
            : 'Stock: $stock',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: stock <= 0
              ? Colors.red
              : stock < 10
                  ? Colors.orange[800]
                  : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
