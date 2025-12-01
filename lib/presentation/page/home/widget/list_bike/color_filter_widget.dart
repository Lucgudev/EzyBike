import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/constants/bike_color.dart';
import 'list_bike_widget_state.dart';
import 'list_bike_widget_viewmodel.dart';

class ColorFilterWidget extends ConsumerWidget {
  final ListBikeWidgetState state;
  final List<String> availableColors;

  const ColorFilterWidget({
    super.key,
    required this.state,
    required this.availableColors,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // "All" filter chip
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: const Text('All'),
                selected: state.selectedColor == null,
                onSelected: (selected) {
                  if (selected) {
                    ref
                        .read(listBikeWidgetViewModelProvider.notifier)
                        .filterByColor(null);
                  }
                },
                backgroundColor: Colors.grey[200],
                selectedColor:
                    Theme.of(context).colorScheme.primaryContainer,
                checkmarkColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            // Color filter chips
            ...availableColors.map((colorValue) {
              final bikeColor = BikeColor.fromString(colorValue);
              final isSelected = state.selectedColor == colorValue;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: bikeColor?.color ?? Colors.grey[700],
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(bikeColor?.displayName ?? colorValue),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      ref
                          .read(listBikeWidgetViewModelProvider.notifier)
                          .filterByColor(colorValue);
                    }
                  },
                  backgroundColor: Colors.grey[200],
                  selectedColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  checkmarkColor: Theme.of(context).colorScheme.primary,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
