import 'dart:async';
import 'dart:developer';
import 'package:evently_app/core/services/snack_bar_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart'; // Add the permission_handler package

class LocationService {
  static Future<Position> getCurrentLocation() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    if (permissionStatus != PermissionStatus.granted) {
      PermissionStatus status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        return Future.error('Location permissions are denied');
      }
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      var result = await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    try {
      var location = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      if (placemarks.isNotEmpty) {
        log("Locality: ${placemarks[0].locality.toString()}");
        log("Country: ${placemarks[0].country.toString()}");
        log("Postal Code: ${placemarks[0].postalCode.toString()}");
        log("Street: ${placemarks[0].street.toString()}");
        log("Sub Locality: ${placemarks[0].subLocality.toString()}");
        log("Sub Admin Area: ${placemarks[0].subAdministrativeArea.toString()}");
        log("Admin Area: ${placemarks[0].administrativeArea.toString()}");
      }
      return location;
    } catch (e) {
      return Future.error('Error fetching location: $e');
    }
  }

  Future<void> streamLocation({required Function updateMarkersCallback}) async {
    try {
      Position position = await LocationService.getCurrentLocation();
      CameraPosition initialCameraPosition = CameraPosition(
        zoom: 15,
        target: LatLng(position.latitude, position.longitude),
      );

      updateMarkersCallback(position.latitude, position.longitude);

      StreamSubscription<Position> positionStream =
          Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 5),
        ),
      ).listen((Position position) {
        updateMarkersCallback(position.latitude, position.longitude);
      });
    } catch (e) {
      SnackBarService.showErrorMessage("Error streaming location: $e");
    }
  }
}
