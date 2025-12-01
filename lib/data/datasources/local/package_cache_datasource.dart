import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/rental_package_model.dart';

class PackageCacheDataSource {
  PackageCacheDataSource();

  static const String _packagesKey = 'cached_packages';
  static const String _packagesTimestampKey = 'cached_packages_timestamp';
  static const int _cacheValidityMinutes = 30;

  Future<List<RentalPackageModel>?> getCachedPackages() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final cachedPackagesJson = prefs.getString(_packagesKey);
      final cachedTimestamp = prefs.getInt(_packagesTimestampKey);

      if (cachedPackagesJson != null && cachedTimestamp != null) {
        final cacheTime = DateTime.fromMillisecondsSinceEpoch(cachedTimestamp);
        final now = DateTime.now();
        final difference = now.difference(cacheTime);

        // If cache is less than 30 minutes old, return it
        if (difference.inMinutes < _cacheValidityMinutes) {
          final List<dynamic> jsonList = json.decode(cachedPackagesJson);
          return jsonList
              .map((json) =>
                  RentalPackageModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> cachePackages(List<RentalPackageModel> packages) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final packagesJson = json.encode(
        packages.map((package) => package.toJson()).toList(),
      );

      await prefs.setString(_packagesKey, packagesJson);
      await prefs.setInt(
          _packagesTimestampKey, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      // Fail silently, caching is not critical
    }
  }

  Future<void> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_packagesKey);
      await prefs.remove(_packagesTimestampKey);
    } catch (e) {
      // Fail silently
    }
  }
}
