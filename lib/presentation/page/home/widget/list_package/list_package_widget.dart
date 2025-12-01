import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sample_bike_customer_app/core/helper/currency_helper.dart';
import 'package:sample_bike_customer_app/data/models/rental_package_model.dart';
import 'package:sample_bike_customer_app/l10n/app_localizations.dart';
import 'list_package_widget_viewmodel.dart';

class ListPackageWidget extends ConsumerWidget {
  final String? title;

  const ListPackageWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageState = ref.watch(listPackageWidgetViewModelProvider);

    return packageState.when(
      data: (state) {
        if (state.packages.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title ?? AppLocalizations.of(context)!.rentalPackages,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.packages.map((package) {
                    return _buildPackageCard(context, package);
                  }).toList(),
                ),
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

  Widget _buildPackageCard(BuildContext context, RentalPackageModel package) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                package.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),

              // Terms (HTML content)
              Expanded(
                child: HtmlWidget(
                  package.terms,
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Price
              Text(
                CurrencyHelper.formatRupiah(package.price),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Get Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement package selection
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.get),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
