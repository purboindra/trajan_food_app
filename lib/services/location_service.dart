import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/route_manager.dart';

class LocationService {
  static Future<bool> _isServicesEnabled() async {
    LocationPermission permission;
    try {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        Get.showSnackbar(const GetSnackBar(
          title: 'Location Services Unenabled',
          message: 'Location service unenabled by user',
          duration: Duration(seconds: 3),
        ));
        return false;
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        // walaupun user meng allow dia tetap akan mereturn false
        if (permission == LocationPermission.denied) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Permission Required',
            message: 'Location permission is required to use this app',
            duration: Duration(seconds: 3),
          ));
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.showSnackbar(const GetSnackBar(
          title: 'Permission Required',
          message: 'Location permission is required to use this app',
          duration: Duration(seconds: 3),
        ));
        return false;
      }

      return true;
    } catch (e) {
      log('Error From Is Services Enabled $e');
      return false;
    }
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      if (!await _isServicesEnabled()) return null;

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      log('Error From Get Current Position $e');
      return null;
    }
  }
}
