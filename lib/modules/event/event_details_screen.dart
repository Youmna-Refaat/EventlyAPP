import 'package:evently_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_icons.dart';
import '../../core/models/event_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/services/firebase_firestore_services.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, t});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final eventDataModel =
        ModalRoute.of(context)?.settings.arguments as EventDataModel;
    final LatLng eventLocation = LatLng(
      eventDataModel.latitude,
      eventDataModel.longitude,
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Event Details",
          style: AppTextStyles.styleMedium20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.iconsEdit),
            onPressed: () {
              context.goToNamed(
                  routeName: ScreensRouteNames.editEventRoute,
                  arguments: eventDataModel);
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.iconsDelete,
              colorFilter:
                  const ColorFilter.mode(AppColors.red, BlendMode.srcIn),
            ),
            onPressed: () async {
              bool confirmDelete = await _showDeleteConfirmationDialog(context);
              if (confirmDelete) {
                bool isDeleted = await FirebaseFirestoreServices.deleteEvent(
                    userId, eventDataModel);

                if (isDeleted) {
                  Navigator.pop(navigatorKey.currentContext!);
                  SnackBarService.showSuccessMessage(
                      'Event deleted successfully');
                } else {
                  SnackBarService.showErrorMessage('Failed to delete event');
                }
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.25.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(eventDataModel.eventImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            16.setVerticalSpace(),
            Text(
              eventDataModel.eventTitle,
              style: AppTextStyles.styleMedium24(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ).setToCenter(),
            16.setVerticalSpace(),
            Container(
              height: 0.09.height,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryColor, width: 1)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      AppIcons.iconsCalender,
                      height: 22,
                    ).setSymmetricPadding(context, horizontal: 5, vertical: 5),
                  ),
                  Text(
                    DateFormat("dd MMM yyy").format(eventDataModel.eventDate),
                    style: AppTextStyles.styleMedium16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ).setSymmetricPadding(context, horizontal: 8, vertical: 4),
                ],
              ).setHorizontalPadding(context, value: 10),
            ),
            16.setVerticalSpace(),
            Container(
              height: 0.09.height,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryColor, width: 1)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      AppIcons.iconsEventLocation,
                      height: 22,
                    ).setSymmetricPadding(context, horizontal: 5, vertical: 5),
                  ),
                  Expanded(
                    child: Text(
                      eventDataModel.location.isNotEmpty
                          ? "Location: ${eventDataModel.location}"
                          : "Choose Event Location",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.styleMedium16(context)
                          .copyWith(color: AppColors.primaryColor),
                    ).setSymmetricPadding(context, horizontal: 8, vertical: 8),
                  ),
                ],
              ).setHorizontalPadding(context, value: 10),
            ),
            16.setVerticalSpace(),
            Container(
              height: 0.4.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GoogleMap(
                  onMapCreated: (controller) {
                    googleMapController = controller;
                    initMapStyle();
                  },
                  initialCameraPosition: CameraPosition(
                    target: eventLocation,
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('eventLocation'),
                      position: eventLocation,
                      infoWindow: InfoWindow(title: eventDataModel.eventTitle),
                    ),
                  },
                ),
              ),
            ),
            16.setVerticalSpace(),
            Text("Description",
                style: AppTextStyles.styleMedium16(context)
                    .copyWith(color: AppColors.primaryColor)),
            Text(
              eventDataModel.eventDescription,
              style: AppTextStyles.styleMedium16(context),
            ),
          ],
        ),
      ).setSymmetricPadding(context, horizontal: 20, vertical: 10),
    );
  }

  Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
    final bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Event'),
          content: const Text('Are you sure you want to delete this event?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
    return shouldDelete ?? false;
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night.json');
    googleMapController.setMapStyle(nightMapStyle);
  }
}
