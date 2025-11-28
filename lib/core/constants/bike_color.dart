import 'package:flutter/material.dart';

enum BikeColor {
  derawanBlue('derawan_blue', Color(0xFF73E3C6)),
  midnightBromo('midnight_bromo', Color(0xFF44556D)),
  ivoryWhite('ivory_white', Color(0xFFE4E4E4)),
  iceNavy('ice_navy', Color(0xFFA7D3DD)),
  beige('beige', Color(0xFFD4CDC2)),
  grey('grey', Color(0xFF7F8388));

  final String value;
  final Color color;

  const BikeColor(this.value, this.color);

  static BikeColor? fromString(String? value) {
    if (value == null) return null;
    try {
      return BikeColor.values.firstWhere(
        (color) => color.value == value,
      );
    } catch (e) {
      return null;
    }
  }

  String get displayName {
    switch (this) {
      case BikeColor.derawanBlue:
        return 'Derawan Blue';
      case BikeColor.midnightBromo:
        return 'Midnight Bromo';
      case BikeColor.ivoryWhite:
        return 'Ivory White';
      case BikeColor.iceNavy:
        return 'Ice Navy';
      case BikeColor.beige:
        return 'Beige';
      case BikeColor.grey:
        return 'Grey';
    }
  }
}
