import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/models/event_category_model.dart';
import '../../../core/models/event_model.dart';
import '../../../core/services/firebase_firestore_services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'widgets/category_card.dart';
import 'widgets/event_card.dart';
import 'widgets/home_header_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  List<EventCategoryModel> eventCategories = [
    EventCategoryModel(categoryName: "All", image: AppImages.imagesGaming),
    EventCategoryModel(categoryName: "Sports", image: AppImages.imagesSport),
    EventCategoryModel(
        categoryName: "Birthdays", image: AppImages.imagesBirthday),
    EventCategoryModel(
        categoryName: "Book Clubs", image: AppImages.imagesBookClub),
    EventCategoryModel(
        categoryName: "Meetings", image: AppImages.imagesMeeting),
    EventCategoryModel(categoryName: "Gaming", image: AppImages.imagesGaming),
    EventCategoryModel(
        categoryName: "Holidays", image: AppImages.imagesHoliday),
    EventCategoryModel(
        categoryName: "Workshops", image: AppImages.imagesWorkshop),
    EventCategoryModel(
        categoryName: "Exhibitions", image: AppImages.imagesExhibition),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryList = [
      CategoryCard(
          icon: AppIcons.iconsAll,
          title: "All",
          isSelected: selectedCategoryIndex == 0,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 0;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsSport,
          title: "Sports",
          isSelected: selectedCategoryIndex == 1,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 1;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsBirthday,
          title: "Birthdays",
          isSelected: selectedCategoryIndex == 2,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 2;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsBookClub,
          title: "Book Club",
          isSelected: selectedCategoryIndex == 3,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 3;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsMeeting,
          title: "Meetings",
          isSelected: selectedCategoryIndex == 4,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 4;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsGaming,
          title: "Gaming",
          isSelected: selectedCategoryIndex == 5,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 5;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsHoliday,
          title: "Holidays",
          isSelected: selectedCategoryIndex == 6,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 6;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsWorkshop,
          title: "Workshops",
          isSelected: selectedCategoryIndex == 7,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 7;
            });
          }),
      CategoryCard(
          icon: AppIcons.iconsExihbition,
          title: "Exhibtions",
          isSelected: selectedCategoryIndex == 8,
          onTap: () {
            setState(() {
              selectedCategoryIndex = 8;
            });
          }),
    ];
    return Column(
      children: [
        HomeHeaderSection(categoryList: categoryList),
        StreamBuilder<QuerySnapshot<EventDataModel>>(
          stream: selectedCategoryIndex == 0
              ? FirebaseFirestoreServices.getUserEventsCollectionReference(
                      userId)
                  .snapshots()
              : FirebaseFirestoreServices.getStreamData(
                  userId,
                  eventCategories[selectedCategoryIndex].categoryName,
                ),
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
                    ),
                  ),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ).setToCenter();
            }

            List<EventDataModel> eventsList = snapshot.data!.docs.map((doc) {
              return doc.data();
            }).toList();

            return eventsList.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      itemCount: eventsList.length,
                      itemBuilder: (context, index) {
                        return EventCard(
                          eventDataModel: eventsList[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          10.setVerticalSpace(),
                    ).setHorizontalPadding(context, value: 20),
                  )
                : Text(
                    "No events available",
                    style: AppTextStyles.styleMedium16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ).setVerticalPadding(context, value: 0.2.height);
          },
        )
      ],
    );
  }
}
