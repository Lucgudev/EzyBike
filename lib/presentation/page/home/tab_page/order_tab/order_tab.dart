import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/l10n/app_localizations.dart';
import 'package:sample_bike_customer_app/presentation/widget/error_state_widget.dart';
import 'order_card_widget.dart';
import 'order_tab_viewmodel.dart';

class OrderTab extends ConsumerWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderTabViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.orderHistory),
        centerTitle: true,
      ),
      body: orderState.when(
        data: (state) {
          if (state.orders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.noOrderHistory,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.yourRentalOrdersWillAppearHere,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[500],
                        ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(orderTabViewModelProvider.notifier).refresh();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return OrderCardWidget(order: order);
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => ErrorStateWidget(
          title: AppLocalizations.of(context)!.failedToLoadOrders,
          errorMessage: error.toString(),
          onRetry: () {
            ref.read(orderTabViewModelProvider.notifier).refresh();
          },
          retryLabel: AppLocalizations.of(context)!.retry,
        ),
      ),
    );
  }
}
