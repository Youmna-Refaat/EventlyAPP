import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/models/event_category_model.dart';
import '../../core/services/location_services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../main.dart';

class EventLocationScreen extends StatefulWidget {
  const EventLocationScreen({super.key});

  @override
  State<EventLocationScreen> createState() => _EventLocationScreenState();
}

class _EventLocationScreenState extends State<EventLocationScreen> {
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  late GoogleMapController googleMapController;
  bool isCameraPositionInitialized = false;
  Set<Marker> markers = {};

  double? markedLatitude;
  double? markedLongitude;

  late int selectedCategoryIndex;
  late List<EventCategoryModel> eventCategories;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime? selectedDate;
  late String userId;

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    _initializeCameraPosition();
  }

  Future<void> _initializeCameraPosition() async {
    try {
      var location = await LocationService.getCurrentLocation();
      setState(() {
        initialCameraPosition = CameraPosition(
          zoom: 15,
          target: LatLng(location.latitude, location.longitude),
        );
        isCameraPositionInitialized = true;
      });
    } catch (e) {
      setState(() {
        initialCameraPosition = const CameraPosition(
          zoom: 8,
          target: LatLng(26.90097230497843, 30.096924944177502),
        );
        isCameraPositionInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraPositionInitialized) {
      return Scaffold(
        body: const CircularProgressIndicator().setToCenter(),
      );
    }

    return Scaffold(
      body: Stack(children: [
        GoogleMap(
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
          onTap: (LatLng tappedPoint) async {
            setState(() {
              markedLatitude = tappedPoint.latitude;
              markedLongitude = tappedPoint.longitude;
              markers.clear();
              myLocationMarker(markedLatitude!, markedLongitude!);
            });

            List<Placemark> placemarks = await placemarkFromCoordinates(
                markedLatitude!, markedLongitude!);
            String location = placemarks.isNotEmpty
                ? placemarks[0].subAdministrativeArea ?? 'Unknown Street'
                : 'Unknown Street';

            Navigator.pop(navigatorKey.currentContext!,
                [markedLatitude, markedLongitude, location]);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 0.07.height,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Text(
              "Tap on Location To Select",
              textAlign: TextAlign.center,
              style: AppTextStyles.styleMedium20(context)
                  .copyWith(color: AppColors.white),
            ).setVerticalPadding(context, value: 10),
          ),
        )
      ]),
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
      markerId: MarkerId('$latitude,$longitude'),
      position: LatLng(latitude, longitude),
    );
    setState(() {
      markers.add(myLocationMarker);
    });
  }
}
