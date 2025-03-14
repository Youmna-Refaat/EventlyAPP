import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/models/user_info_model.dart';
import '../../../../core/services/firebase_firestore_services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileHeaderSection extends StatefulWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  State<ProfileHeaderSection> createState() => _ProfileHeaderSectionState();
}

class _ProfileHeaderSectionState extends State<ProfileHeaderSection> {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserInformationModel?>(
        future: FirebaseFirestoreServices.getUserData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 0.3.height,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
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
                bottomLeft: Radius.circular(60),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 0.14.height,
                  width: 0.3.width,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AppImages.imagesProfile),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                15.setHorizontalSpace(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData.name,
                        style: AppTextStyles.styleBold24(context).copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        userData.email,
                        style: AppTextStyles.styleMedium16(context).copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).setSymmetricPadding(context, horizontal: 20, vertical: 50),
          );
        });
  }
}
