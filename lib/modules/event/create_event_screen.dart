import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/event_category_model.dart';
import '../../core/models/event_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/services/firebase_firestore_services.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../main.dart';
import '../layouts/home/widgets/category_card.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({
    super.key,
  });

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  List<Widget> eventsList = [];
  List<EventCategoryModel> eventCategories = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser!.uid;
  EventDataModel? eventDataModel;
  int selectedCategoryIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  double? selectedLatitude;
  double? selectedLongitude;
  String location = "";
  @override
  void initState() {
    super.initState();
    eventCategories = [
      EventCategoryModel(
        image: AppImages.imagesSport,
        categoryName: "Sports",
      ),
      EventCategoryModel(
        image: AppImages.imagesBirthday,
        categoryName: "Birthdays",
      ),
      EventCategoryModel(
        image: AppImages.imagesBookClub,
        categoryName: "Book Clubs",
      ),
      EventCategoryModel(
        image: AppImages.imagesMeeting,
        categoryName: "Meetings",
      ),
      EventCategoryModel(
        image: AppImages.imagesGaming,
        categoryName: "Gaming",
      ),
      EventCategoryModel(
        image: AppImages.imagesHoliday,
        categoryName: "Holidays",
      ),
      EventCategoryModel(
        image: AppImages.imagesWorkshop,
        categoryName: "Workshops",
      ),
      EventCategoryModel(
        image: AppImages.imagesExhibition,
        categoryName: "Exhibtions",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoryList = [
      CategoryCard(
        icon: AppIcons.iconsSport,
        title: context.l10n.categorySports,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 0,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 0;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsBirthday,
        title: context.l10n.categoryBirthdays,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 1,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 1;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsBookClub,
        title: context.l10n.categoryBookClub,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 2,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 2;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsMeeting,
        title: context.l10n.categoryMeetings,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 3,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 3;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsGaming,
        title: context.l10n.categoryGaming,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 4,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 4;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsHoliday,
        title: context.l10n.categoryHolidays,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 5,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 5;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsWorkshop,
        title: context.l10n.categoryWorkshops,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 6,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 6;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsExihbition,
        title: context.l10n.categoryExhibitions,
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 7,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 7;
          });
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.createEvent,
          style: AppTextStyles.styleMedium20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            navigatorKey.currentContext!
                .goToNamed(routeName: ScreensRouteNames.layoutRoute);
          },
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 0.25.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(eventCategories[selectedCategoryIndex].image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
            ).setHorizontalPadding(context, value: 20),
            16.setVerticalSpace(),
            SizedBox(
              height: 0.07.height,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return categoryList[index].setOnlyPadding(context, left: 8);
                  }).setOnlyPadding(context, bottom: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.titleLabel, style: AppTextStyles.styleMedium16(context)),
                5.setVerticalSpace(),
                CustomTextFormField(
                  controller: titleController,
                  hintText: context.l10n.eventTitleHint,
                  prefixIcn: const Icon(
                    Icons.edit,
                    color: AppColors.grey,
                  ),
                ),
                16.setVerticalSpace(),
                Text(context.l10n.description,
                    style: AppTextStyles.styleMedium16(context)),
                5.setVerticalSpace(),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: context.l10n.eventDescriptionHint,
                  minLines: 3,
                ),
                16.setVerticalSpace(),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.iconsCalender,
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                    ),
                    5.setHorizontalSpace(),
                    Text(
                      context.l10n.eventDate,
                      style: AppTextStyles.styleMedium16(context),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        selectedEventDate(context);
                      },
                      child: Text(
                        selectedDate != null
                            ? DateFormat("dd MMM yyy").format(selectedDate!)
                            : context.l10n.chooseDate,
                        style: AppTextStyles.styleMedium16(context).copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                16.setVerticalSpace(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                              context, ScreensRouteNames.eventLocationMapRoute)
                          .then((value) {
                        if (value != null && value is List<dynamic>) {
                          setState(() {
                            selectedLatitude = value[0];
                            selectedLongitude = value[1];
                            location = value[2];
                          });
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              AppIcons.iconsEventLocation,
                              height: 22,
                            ).setSymmetricPadding(context,
                                horizontal: 5, vertical: 5),
                          ),
                          selectedLatitude != null && selectedLongitude != null
                              ? Expanded(
                                  child: Text(
                                    context.l10n.locationLabel(location),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.styleMedium16(context)
                                        .copyWith(
                                            color: AppColors.primaryColor),
                                  ).setSymmetricPadding(context,
                                      horizontal: 20, vertical: 10),
                                )
                              : Text(
                                  context.l10n.chooseEventLocation,
                                  style: AppTextStyles.styleMedium16(context)
                                      .copyWith(color: AppColors.primaryColor),
                                ).setSymmetricPadding(context,
                                  horizontal: 20, vertical: 20),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ).setHorizontalPadding(context, value: 10),
                    )),
                16.setVerticalSpace(),
                CustomElevatedButton(
                  text: context.l10n.addEvent,
                  onPressed: () {
                    String selectedCategoryName =
                        eventCategories[selectedCategoryIndex].categoryName;
                    String selectedCategoryImage =
                        eventCategories[selectedCategoryIndex].image;
                    if (formkey.currentState!.validate()) {
                      if (selectedDate != null) {
                        var eventData = EventDataModel(
                          eventTitle: titleController.text,
                          eventDescription: descriptionController.text,
                          eventCategory: selectedCategoryName,
                          eventImage: selectedCategoryImage,
                          eventDate: selectedDate!,
                          latitude: selectedLatitude ?? 0.0,
                          longitude: selectedLongitude ?? 0.0,
                          location: location,
                        );

                        EasyLoading.show();
                        FirebaseFirestoreServices.createNewEvent(
                                userId, eventData)
                            .then((value) {
                          EasyLoading.dismiss();
                          if (value == true) {
                            navigatorKey.currentContext!.goToNamed(
                                routeName: ScreensRouteNames.layoutRoute);
                            SnackBarService.showSuccessMessage(
                                context.l10n.eventCreatedSuccessfully);
                          }
                        });
                      } else {
                        SnackBarService.showErrorMessage(
                            context.l10n.mustSelectEventDate);
                      }
                    }
                  },
                ),
                15.setVerticalSpace(),
              ],
            ).setOnlyPadding(context, right: 20, left: 20, bottom: 10),
          ]),
        ),
      ),
    );
  }

  void selectedEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogTheme:
                const DialogThemeData(backgroundColor: AppColors.white),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      selectedDate = newDate;
    });
  }
}
