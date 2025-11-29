import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/provider/bike_rent_form_provider.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/widget/bike_pickup_location/bike_pickup_location_widget.dart';
import 'package:sample_bike_customer_app/presentation/page/bike_rent/widget/rent_duration/rent_duration_widget.dart';

class BikeRentFormWidget extends ConsumerWidget {
  final TextEditingController phoneController;

  const BikeRentFormWidget({
    super.key,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Start Date Field
        _buildStartDateField(context, ref),
        const SizedBox(height: 16),

        // Pickup Location Field
        _buildPickupLocationField(context, ref),
        const SizedBox(height: 16),

        // Phone Number Field
        _buildPhoneNumberField(context),
        const SizedBox(height: 16),

        // Duration Field
        _buildDurationField(context, ref),
      ],
    );
  }

  Widget _buildStartDateField(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedStartDateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start Date',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _selectStartDate(context, ref),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey[600]),
                const SizedBox(width: 12),
                Text(
                  selectedDate == null
                      ? 'Select start date'
                      : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: selectedDate == null
                            ? Colors.grey[600]
                            : Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPickupLocationField(BuildContext context, WidgetRef ref) {
    final selectedPickupLocation = ref.watch(selectedPickupLocationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pickup Location',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _showPickupLocationBottomSheet(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[600]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedPickupLocation?.name ?? 'Select pickup location',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: selectedPickupLocation == null
                              ? Colors.grey[600]
                              : Colors.black,
                        ),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter your phone number',
            prefixIcon: const Icon(Icons.phone),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDurationField(BuildContext context, WidgetRef ref) {
    final selectedDuration = ref.watch(selectedRentDurationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _showDurationBottomSheet(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey[600]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedDuration == null
                        ? 'Select duration'
                        : selectedDuration.duration,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: selectedDuration == null
                              ? Colors.grey[600]
                              : Colors.black,
                        ),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectStartDate(BuildContext context, WidgetRef ref) async {
    final selectedDate = ref.read(selectedStartDateProvider);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      ref.read(selectedStartDateProvider.notifier).setDate(picked);
    }
  }

  void _showPickupLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) =>
            const BikePickupLocationWidget(),
      ),
    );
  }

  void _showDurationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) => const RentDurationWidget(),
      ),
    );
  }
}
