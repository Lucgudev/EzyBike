import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/constants/bike_color.dart';
import 'package:sample_bike_customer_app/core/helper/currency_helper.dart';
import 'package:sample_bike_customer_app/core/provider/global_provider.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'list_bike_widget_viewmodel.dart';
import 'stock_badge_widget.dart';

class ListBikeWidget extends ConsumerWidget {
  const ListBikeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bikeState = ref.watch(listBikeWidgetViewModelProvider);

    return bikeState.when(
      data: (state) {
        if (state.bikes.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Available Bikes',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: state.bikes.length,
                itemBuilder: (context, index) {
                  final bike = state.bikes[index];
                  return _buildBikeCard(context, ref, bike);
                },
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox(
        height: 200,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }

  Widget _buildBikeCard(BuildContext context, WidgetRef ref, BikeModel bike) {
    final isOutOfStock = bike.stock <= 0;

    return Opacity(
      opacity: isOutOfStock ? 0.5 : 1.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: isOutOfStock
              ? null
              : () {
                  ref.read(navigatorKeyProvider).currentState?.pushNamed(
                        Routes.bikeDetailPage,
                        arguments: bike,
                      );
                },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bike Image
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Image.network(
                    bike.photoUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.pedal_bike,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Bike Info
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bike.model,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (bike.color != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      BikeColor.fromString(bike.color)?.color ??
                                      Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                BikeColor.fromString(bike.color)?.displayName ??
                                    bike.color!,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                        // Price
                        const SizedBox(height: 8),
                        Text(
                          '${CurrencyHelper.formatRupiah(bike.rentalPricePerDay)}/day',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Stock Badge
                    StockBadgeWidget(stock: bike.stock),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
