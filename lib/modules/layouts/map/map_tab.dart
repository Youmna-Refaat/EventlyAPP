import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/services/location_services.dart';
import '../../../core/theme/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final CameraPosition initialCameraPosition;
  late final LocationService locationService;

  GoogleMapController? googleMapController;

  Set<Marker> markers = {};

  bool isLoadingLocation = false;

  @override
  void initState() {
    super.initState();

    initialCameraPosition = const CameraPosition(
      zoom: 8,
      target: LatLng(
        26.90097230497843,
        30.096924944177502,
      ),
    );

    locationService = LocationService();
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          onPressed: isLoadingLocation ? null : _goToCurrentLocation,
          child: isLoadingLocation
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Icon(
                  Icons.location_searching_rounded,
                ),
        ).setSymmetricPadding(
          context,
          horizontal: 20,
          vertical: 80,
        ),
      ),
      body: GoogleMap(
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        markers: markers,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (controller) {
          googleMapController = controller;
          initMapStyle();
        },
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    if (googleMapController == null) return;

    setState(() {
      isLoadingLocation = true;
    });

    try {
      final location = await LocationService.getCurrentLocation();

      if (!mounted) return;

      final position = LatLng(
        location.latitude,
        location.longitude,
      );

      await googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 15,
            target: position,
          ),
        ),
      );

      await myLocationMarker(
        location.latitude,
        location.longitude,
      );
    } catch (e) {
      if (!mounted) return;

      _showLocationError(
        'Unable to get your current location.',
      );

      debugPrint(
        'Location error: $e',
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoadingLocation = false;
        });
      }
    }
  }

  Future<void> initMapStyle() async {
    if (googleMapController == null) return;

    try {
      final nightMapStyle = await DefaultAssetBundle.of(context)
          .loadString('assets/map_styles/night.json');

      await googleMapController!.setMapStyle(nightMapStyle);
    } catch (e) {
      debugPrint(
        'Map style error: $e',
      );
    }
  }

  Future<void> myLocationMarker(
    double latitude,
    double longitude,
  ) async {
    final customMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/images/marker.png',
    );

    final marker = Marker(
      icon: customMarkerIcon,
      markerId: const MarkerId('current_location'),
      position: LatLng(
        latitude,
        longitude,
      ),
    );

    if (!mounted) return;

    setState(() {
      markers = {
        ...markers,
        marker,
      };
    });
  }

  void _showLocationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Settings',
          onPressed: () {
            Geolocator.openAppSettings();
          },
        ),
      ),
    );
  }

  void listenToLocation() {
    final stream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    stream.listen(
      (Position newLocation) {
        myLocationMarker(
          newLocation.latitude,
          newLocation.longitude,
        );

        googleMapController?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(
              newLocation.latitude,
              newLocation.longitude,
            ),
            15,
          ),
        );
      },
    );
  }
}
