import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/user_info_model.dart';
import '../../../../core/services/firebase_firestore_services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../settings_provider.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({
    super.key,
    required this.categoryList,
  });

  final List<Widget> categoryList;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder<UserInformationModel?>(
        future: FirebaseFirestoreServices.getUserData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 0.29.height,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No user data found'));
          }

          final userData = snapshot.data!;
          return Container(
            height: 0.3.height,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.setVerticalSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: AppTextStyles.styleRegular14(context)
                                  .copyWith(color: AppColors.white),
                            ),
                            Text(
                              userData.name,
                              style: AppTextStyles.styleBold24(context)
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      20.setHorizontalSpace(),
                      GestureDetector(
                        onTap: () {
                          if (provider.isDark()) {
                            provider.setCurrentTheme(ThemeMode.light);
                          } else {
                            provider.setCurrentTheme(ThemeMode.dark);
                          }
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(
                            provider.isDark()
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.setHorizontalSpace(),
                      TextButton(
                        onPressed: () {
                          if (provider.currentLanguage == 'en') {
                            provider.setCurrentLanguage('ar');
                          } else {
                            provider.setCurrentLanguage('en');
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.white,
                          minimumSize: const Size(30, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          provider.currentLanguage == 'en' ? 'AR' : 'EN',
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ).setSymmetricPadding(
                    context,
                    horizontal: 15,
                    vertical: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                      ),
                      Text(
                        "Cairo , Egypt",
                        style: AppTextStyles.styleMedium14(context)
                            .copyWith(color: AppColors.white),
                      )
                    ],
                  ).setHorizontalPadding(context, value: 15),
                  0.02.height.setVerticalSpace(),
                  SizedBox(
                    height: 0.07.height,
                    child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return categoryList[index]
                                  .setOnlyPadding(context, right: 5);
                            })
                        .setOnlyPadding(context, bottom: 15, right: 5, left: 5),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
