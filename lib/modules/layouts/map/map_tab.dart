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
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late GoogleMapController googleMapController;
  bool isFirstCall = true;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(
      zoom: 8,
      target: LatLng(26.90097230497843, 30.096924944177502),
    );
    locationService = LocationService();
  }

  @override
  void dispose() {
    googleMapController.dispose();
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
          onPressed: () async {
            var location = await LocationService.getCurrentLocation();
            initialCameraPosition = CameraPosition(
              zoom: 15,
              target: LatLng(location.latitude, location.longitude),
            );
            googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(initialCameraPosition));
            myLocationMarker(location.latitude, location.longitude);
            setState(() {});
          },
          child: const Icon(
            Icons.location_searching_rounded,
          ),
        ).setSymmetricPadding(context, horizontal: 20, vertical: 80),
      ),
      body: GoogleMap(
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        markers: markers,
        onMapCreated: (controller) {
          googleMapController = controller;
          initMapStyle();
        },
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night.json');
    googleMapController.setMapStyle(nightMapStyle);
  }

  void myLocationMarker(double latitude, double longitude) async {
    var customMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/marker.png');
    var myLocationMarker = Marker(
      icon: customMarkerIcon,
      markerId: const MarkerId('current location'),
      position: LatLng(latitude, longitude),
    );
    setState(() {
      markers.add(myLocationMarker);
    });
  }

  listenToLocation() {
    var stream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ));
    stream.listen((Position newLocation) {
      myLocationMarker(newLocation.latitude, newLocation.longitude);
      googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(
            LatLng(newLocation.latitude, newLocation.longitude), 15),
      );
      setState(() {});
    });
  }
}
