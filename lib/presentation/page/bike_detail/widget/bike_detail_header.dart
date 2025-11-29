import 'package:flutter/material.dart';
import 'package:sample_bike_customer_app/core/constants/bike_color.dart';
import 'package:sample_bike_customer_app/core/helper/currency_helper.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'package:sample_bike_customer_app/presentation/page/home/widget/list_bike/stock_badge_widget.dart';

class BikeDetailHeader extends StatelessWidget {
  final BikeModel bike;

  const BikeDetailHeader({
    super.key,
    required this.bike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  bike.model,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              StockBadgeWidget(stock: bike.stock),
            ],
          ),
          if (bike.color != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        BikeColor.fromString(bike.color)?.color ??
                        Colors.grey[700],
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  BikeColor.fromString(bike.color)?.displayName ?? bike.color!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          // Rental Price
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  CurrencyHelper.formatRupiah(bike.rentalPricePerDay),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  ' /day',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
