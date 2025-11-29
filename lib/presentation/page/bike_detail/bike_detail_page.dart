import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/router/app_navigator_impl.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'widget/bike_detail_app_bar.dart';
import 'widget/bike_detail_header.dart';
import 'widget/bike_detail_specification.dart';
import 'widget/bike_detail_description.dart';

class BikeDetailPage extends ConsumerWidget {
  const BikeDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bike = ModalRoute.of(context)!.settings.arguments as BikeModel;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              BikeDetailAppBar(bike: bike),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BikeDetailHeader(bike: bike),
                    const SizedBox(height: 24),
                    BikeDetailSpecification(bike: bike),
                    const SizedBox(height: 24),
                    if (bike.description != null) ...[
                      BikeDetailDescription(bike: bike),
                      const SizedBox(height: 24),
                    ],
                    const SizedBox(
                      height: 80,
                    ), // Extra padding for sticky button
                  ],
                ),
              ),
            ],
          ),
          _buildBottomButton(context, ref, bike),
        ],
      ),
    );
  }

  Widget _buildBottomButton(
    BuildContext context,
    WidgetRef ref,
    BikeModel bike,
  ) {
    final isOutOfStock = bike.stock <= 0;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: isOutOfStock
                  ? null
                  : () {
                      _handleRentInterest(ref, bike);
                    },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                isOutOfStock ? 'Out of Stock' : 'I\'m interested to rent',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleRentInterest(WidgetRef ref, BikeModel bike) {
    ref
        .read(appNavigatorProvider)
        .pushNamedWithResult(
          Routes.bikeRentPage,
          arguments: bike,
        );
  }
}
