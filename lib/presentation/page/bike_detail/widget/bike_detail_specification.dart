import 'package:flutter/material.dart';
import 'package:sample_bike_customer_app/data/models/bike_model.dart';
import '../model/spec_item_model.dart';

class BikeDetailSpecification extends StatelessWidget {
  final BikeModel bike;

  const BikeDetailSpecification({
    super.key,
    required this.bike,
  });

  @override
  Widget build(BuildContext context) {
    final specs = [
      if (bike.range > 0)
        SpecItemModel(
          icon: Icons.route,
          label: 'Range',
          value: '${bike.range} km',
          color: Colors.blue,
        ),
      if (bike.maxSpeed != null)
        SpecItemModel(
          icon: Icons.speed,
          label: 'Max Speed',
          value: '${bike.maxSpeed} km/h',
          color: Colors.orange,
        ),
      if (bike.batteryCapacity != null)
        SpecItemModel(
          icon: Icons.battery_charging_full,
          label: 'Battery',
          value: '${bike.batteryCapacity} Ah',
          color: Colors.green,
        ),
    ];

    if (specs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Specifications',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: specs.length >= 3 ? 3 : specs.length,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: specs.length,
            itemBuilder: (context, index) {
              return _buildSpecCard(context, specs[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecCard(BuildContext context, SpecItemModel spec) {
    return Container(
      decoration: BoxDecoration(
        color: spec.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: spec.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            spec.icon,
            size: 32,
            color: spec.color,
          ),
          const SizedBox(height: 8),
          Text(
            spec.value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: spec.color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            spec.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
