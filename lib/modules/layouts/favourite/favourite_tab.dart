import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/models/event_model.dart';
import '../../../core/services/firebase_firestore_services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../home/widgets/event_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String searchQuery = "";
  List<EventDataModel> searchFavouritesList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            20.setVerticalSpace(),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
                search();
              },
              style: AppTextStyles.styleBold14(context)
                  .copyWith(color: AppColors.primaryColor),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                hintText: "Search for Event",
                hintStyle: AppTextStyles.styleBold14(context)
                    .copyWith(color: AppColors.primaryColor),
                prefixIcon: SvgPicture.asset(AppIcons.iconsSearch)
                    .setSymmetricPadding(context, horizontal: 10, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ).setOnlyPadding(context, bottom: 5),
            StreamBuilder<QuerySnapshot<EventDataModel>>(
              stream: FirebaseFirestoreServices.getStreamFavoriteData(userId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(
                        "Something went wrong..",
                        style: AppTextStyles.styleMedium16(context)
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh_rounded,
                            color: AppColors.grey,
                          ))
                    ],
                  ).setVerticalPadding(context, value: 0.3.height);
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ).setToCenter();
                }

                List<EventDataModel> eventsList =
                    snapshot.data!.docs.map((doc) {
                  return doc.data();
                }).toList();

                List<EventDataModel> favouriteEvents =
                    eventsList.where((event) => event.isFavourite).toList();

                List<EventDataModel> eventsToDisplay = searchQuery.isEmpty
                    ? favouriteEvents
                    : searchFavouritesList;

                return eventsToDisplay.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: eventsToDisplay.length,
                          separatorBuilder: (context, index) =>
                              10.setVerticalSpace(),
                          itemBuilder: (context, index) {
                            return EventCard(
                              eventDataModel: eventsToDisplay[index],
                            ).setOnlyPadding(context, bottom: 20);
                          },
                        ),
                      )
                    : Text(
                        "No events available",
                        style: AppTextStyles.styleMedium16(context)
                            .copyWith(color: AppColors.primaryColor),
                      ).setVerticalPadding(context, value: 0.3.height);
              },
            ),
          ],
        ).setHorizontalPadding(context, value: 15),
      ),
    );
  }

  void search() {
    searchFavouritesList = [];
    FirebaseFirestoreServices.getStreamFavoriteData(userId)
        .first
        .then((snapshot) {
      List<EventDataModel> eventsList =
          snapshot.docs.map((doc) => doc.data()).toList();

      searchFavouritesList = eventsList.where((event) {
        return event.eventTitle
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();

      setState(() {});
    });
  }
}
