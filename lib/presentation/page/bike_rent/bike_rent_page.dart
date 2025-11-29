import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/router/app_navigator_impl.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import 'bike_rent_page_viewmodel.dart';
import 'provider/bike_rent_form_provider.dart';
import 'widget/bike_info_card/bike_info_card_widget.dart';
import 'widget/bike_rent_form/bike_rent_form_widget.dart';
import 'widget/price_summary/price_summary_widget.dart';

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
      ref
          .read(phoneNumberProvider.notifier)
          .setPhoneNumber(_phoneController.text);
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
                BikeInfoCardWidget(bike: bike),
                const SizedBox(height: 32),

                // Form Title
                Text(
                  'Rental Details',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Rental Form Fields
                BikeRentFormWidget(phoneController: _phoneController),
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

  Future<void> _handleRentSubmit() async {
    final bike = ModalRoute.of(context)!.settings.arguments as BikeModel;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Submit rent
      await ref.read(bikeRentPageViewModelProvider.notifier).submitRent(bike);

      // Close loading dialog
      if (mounted) Navigator.of(context).pop();

      // Clear phone controller
      _phoneController.clear();

      // Navigate to success page
      if (mounted) {
        ref
            .read(appNavigatorProvider)
            .pushReplacementNamedWithResult(
              Routes.bikeRentSuccessPage,
            );
      }
    } catch (e) {
      // Close loading dialog
      if (mounted) Navigator.of(context).pop();

      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit rent: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
