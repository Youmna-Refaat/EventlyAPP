import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser!.uid;

  int selectedCategoryIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? categoryImage;
  double? selectedLatitude;
  double? selectedLongitude;
  String location = "";
  @override
  Widget build(BuildContext context) {
    final eventDataModel =
        ModalRoute.of(context)?.settings.arguments as EventDataModel;

    titleController.text = eventDataModel.eventTitle;
    descriptionController.text = eventDataModel.eventDescription;
    selectedDate = eventDataModel.eventDate;
    categoryImage = eventDataModel.eventImage;
    selectedLatitude = eventDataModel.latitude;
    selectedLongitude = eventDataModel.longitude;
    location = eventDataModel.location;
    final List<Widget> categoryList = [
      CategoryCard(
        icon: AppIcons.iconsSport,
        title: "Sports",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 0,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 0;
            categoryImage = AppImages.imagesSport;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsBirthday,
        title: "Birthdays",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 1,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 1;
            categoryImage = AppImages.imagesBirthday;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsBookClub,
        title: "Book Club",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 2,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 2;
            categoryImage = AppImages.imagesBookClub;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsMeeting,
        title: "Meetings",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 3,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 3;
            categoryImage = AppImages.imagesMeeting;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsGaming,
        title: "Gaming",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 4,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 4;
            categoryImage = AppImages.imagesGaming;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsHoliday,
        title: "Holidays",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 5,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 5;
            categoryImage = AppImages.imagesHoliday;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsWorkshop,
        title: "Workshops",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 6,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 6;
            categoryImage = AppImages.imagesWorkshop;
          });
        },
      ),
      CategoryCard(
        icon: AppIcons.iconsExihbition,
        title: "Exhibtions",
        borderColor: AppColors.primaryColor,
        isSelected: selectedCategoryIndex == 7,
        onTap: () {
          setState(() {
            selectedCategoryIndex = 7;
            categoryImage = AppImages.imagesExhibition;
          });
        },
      ),
    ];
    List<EventCategoryModel> categories = [
      EventCategoryModel(
        categoryName: "Sports",
        image: AppImages.imagesSport,
      ),
      EventCategoryModel(
        categoryName: "Birthdays",
        image: AppImages.imagesBirthday,
      ),
      EventCategoryModel(
        categoryName: "Book Club",
        image: AppImages.imagesBookClub,
      ),
      EventCategoryModel(
        categoryName: "Meetings",
        image: AppImages.imagesMeeting,
      ),
      EventCategoryModel(
        categoryName: "Gaming",
        image: AppImages.imagesGaming,
      ),
      EventCategoryModel(
        categoryName: "Holidays",
        image: AppImages.imagesHoliday,
      ),
      EventCategoryModel(
        categoryName: "Workshops",
        image: AppImages.imagesWorkshop,
      ),
      EventCategoryModel(
        categoryName: "Exhibtions",
        image: AppImages.imagesExhibition,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Edit Event",
          style: AppTextStyles.styleMedium20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            navigatorKey.currentContext!.goToNamed(
              routeName: ScreensRouteNames.eventDetailsRoute,
              arguments: eventDataModel,
            );
          },
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.25.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categories[selectedCategoryIndex].image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              16.setVerticalSpace(),
              SizedBox(
                height: 0.07.height,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return categoryList[index]
                          .setOnlyPadding(context, left: 8);
                    }).setOnlyPadding(context, bottom: 10),
              ),
              Text("Title", style: AppTextStyles.styleMedium16(context)),
              5.setVerticalSpace(),
              CustomTextFormField(
                controller: titleController,
                hintText: "Event Title",
                prefixIcn: const Icon(
                  FontAwesomeIcons.penToSquare,
                  color: AppColors.grey,
                ),
              ),
              16.setVerticalSpace(),
              Text("Description", style: AppTextStyles.styleMedium16(context)),
              5.setVerticalSpace(),
              CustomTextFormField(
                controller: descriptionController,
                hintText: "Event Description",
                minLines: 3,
              ),
              16.setVerticalSpace(),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                  ),
                  5.setHorizontalSpace(),
                  Text(
                    "Event Date",
                    style: AppTextStyles.styleMedium16(context),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selectedEventDate(context, eventDataModel);
                    },
                    child: Text(
                      DateFormat("dd MMM yyy").format(eventDataModel.eventDate),
                      style: AppTextStyles.styleMedium16(context).copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              16.setVerticalSpace(),
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    ScreensRouteNames.eventLocationMapRoute,
                  );
                  if (result != null && result is List<dynamic>) {
                    setState(() {
                      selectedLatitude = result[0];
                      selectedLongitude = result[1];
                      location = result[2];
                    });
                  }
                },
                child: Container(
                  height: 0.09.height,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
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
                      Expanded(
                        child: Text(
                          location.isNotEmpty
                              ? "Location: $location"
                              : "Choose Event Location",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.styleMedium16(context)
                              .copyWith(color: AppColors.primaryColor),
                        ).setSymmetricPadding(context,
                            horizontal: 8, vertical: 8),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          color: AppColors.primaryColor),
                    ],
                  ).setHorizontalPadding(context, value: 10),
                ),
              ),
              16.setVerticalSpace(),
              CustomElevatedButton(
                text: "Update Event",
                onPressed: () async {
                  eventDataModel.eventTitle = titleController.text;
                  eventDataModel.eventDescription = descriptionController.text;
                  eventDataModel.eventDate = selectedDate!;
                  eventDataModel.eventCategory =
                      categories[selectedCategoryIndex].categoryName;
                  eventDataModel.eventImage =
                      categories[selectedCategoryIndex].image;
                  eventDataModel.latitude = selectedLatitude ?? 0.0;
                  eventDataModel.longitude = selectedLongitude ?? 0.0;
                  eventDataModel.location = location;

                  bool isUpdated = await FirebaseFirestoreServices.updateEvent(
                      userId, eventDataModel);

                  if (isUpdated) {
                    Navigator.pop(context, eventDataModel);
                    SnackBarService.showSuccessMessage(
                        "Event Updated Successfully");
                  } else {
                    SnackBarService.showErrorMessage("Failed to update event");
                  }
                },
              ),
            ],
          ),
        ).setSymmetricPadding(
          context,
          horizontal: 20,
          vertical: 10,
        ),
      ),
    );
  }

  void selectedEventDate(
      BuildContext context, EventDataModel eventDataModel) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ));
    setState(() {
      eventDataModel.eventDate = selectedDate!;
    });
  }
}
