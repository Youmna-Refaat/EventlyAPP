import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/event_model.dart';
import '../../../../core/routes/screens_route_names.dart';
import '../../../../core/services/firebase_firestore_services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class EventCard extends StatelessWidget {
  final EventDataModel eventDataModel;

  const EventCard({
    super.key,
    required this.eventDataModel,
  });

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return GestureDetector(
      onTap: () {
        context.goToNamed(
          routeName: ScreensRouteNames.eventDetailsRoute,
          arguments: eventDataModel,
        );
      },
      child: Container(
        height: 0.27.height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(eventDataModel.eventImage),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: AppColors.primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                textAlign: TextAlign.center,
                DateFormat("dd \nMMM").format(eventDataModel.eventDate),
                style: AppTextStyles.styleBold20(context)
                    .copyWith(color: AppColors.primaryColor),
              ).setSymmetricPadding(context, horizontal: 10, vertical: 4),
            ).setSymmetricPadding(context, horizontal: 10, vertical: 10),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    eventDataModel.eventTitle,
                    maxLines: 2,
                    style: AppTextStyles.styleBold14(context),
                  ).setSymmetricPadding(context, horizontal: 8, vertical: 8),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      eventDataModel.isFavourite = !eventDataModel.isFavourite;

                      FirebaseFirestoreServices.updateFavouriteEvent(
                        userId,
                        eventDataModel.eventID,
                        eventDataModel.isFavourite,
                      );
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        eventDataModel.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ).setHorizontalPadding(context, value: 10),
            ).setSymmetricPadding(context, horizontal: 10, vertical: 10),
          ],
        ),
      ),
    );
  }
}
