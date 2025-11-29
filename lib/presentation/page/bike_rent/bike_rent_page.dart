import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/constants/bike_color.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'bike_rent_page_viewmodel.dart';
import 'provider/bike_rent_form_provider.dart';
import 'widget/bike_pickup_location/bike_pickup_location_widget.dart';
import 'widget/price_summary/price_summary_widget.dart';
import 'widget/rent_duration/rent_duration_widget.dart';

class BikeRentPage extends ConsumerStatefulWidget {
  const BikeRentPage({super.key});

  @override
  ConsumerState<BikeRentPage> createState() => _BikeRentPageState();
}

class _BikeRentPageState extends ConsumerState<BikeRentPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      ref.read(phoneNumberProvider.notifier).setPhoneNumber(_phoneController.text);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bike = ModalRoute.of(context)!.settings.arguments as BikeModel;
    final pageState = ref.watch(bikeRentPageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Bike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bike Info Card
                _buildBikeInfoCard(context, bike),
                const SizedBox(height: 32),

                // Form Title
                Text(
                  'Rental Details',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 24),

                // Start Date Field
                _buildStartDateField(context),
                const SizedBox(height: 16),

                // Pickup Location Field
                _buildPickupLocationField(context),
                const SizedBox(height: 16),

                // Phone Number Field
                _buildPhoneNumberField(context),
                const SizedBox(height: 16),

                // Duration Field
                _buildDurationField(context),
                const SizedBox(height: 24),

                // Price Summary
                PriceSummaryWidget(bike: bike),
                const SizedBox(height: 32),

                // Rent Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: pageState.isFormValid ? _handleRentSubmit : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Rent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBikeInfoCard(BuildContext context, BikeModel bike) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Bike Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                bike.photoUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.pedal_bike,
                      size: 40,
                      color: Colors.grey[400],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Bike Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bike.model,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (bike.color != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BikeColor.fromString(bike.color)?.color ??
                                Colors.grey[700],
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          BikeColor.fromString(bike.color)?.displayName ??
                              bike.color!,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStartDateField(BuildContext context) {
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
          onTap: () => _selectStartDate(context),
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

  Widget _buildPickupLocationField(BuildContext context) {
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
          onTap: _showPickupLocationBottomSheet,
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
          controller: _phoneController,
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

  Widget _buildDurationField(BuildContext context) {
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
          onTap: _showDurationBottomSheet,
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
                        : '$selectedDuration days',
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

  Future<void> _selectStartDate(BuildContext context) async {
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

  void _showPickupLocationBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) => const BikePickupLocationWidget(),
      ),
    );
  }

  void _showDurationBottomSheet() {
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

  void _handleRentSubmit() {
    final selectedDate = ref.read(selectedStartDateProvider);
    final selectedPickupLocation = ref.read(selectedPickupLocationProvider);
    final selectedDuration = ref.read(selectedRentDurationProvider);

    if (_formKey.currentState!.validate()) {
      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a start date'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (selectedPickupLocation == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a pickup location'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (selectedDuration == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a duration'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // TODO: Implement rent submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rent submission will be implemented'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
