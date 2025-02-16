import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_images.dart';
import '../../core/services/firebase_authentication_services.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../main.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  Future<void> _resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      SnackBarService.showErrorMessage("Please enter your email");
      return;
    }

    bool success = await FirebaseAuthServices.resetPassword(email: email);

    if (success) {
      Navigator.pop(navigatorKey.currentContext!);
      SnackBarService.showSuccessMessage(
          "Password reset link\nsent to your email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(
            "Forget Password",
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.imagesForgetPassword),
              CustomTextFormField(
                controller: emailController,
                hintText: "Email",
                prefixIcn: SvgPicture.asset(
                  AppIcons.iconsEmail,
                  height: 5,
                ),
              ).setVerticalPadding(context, value: 0.02.height),
              CustomElevatedButton(
                text: "Reset Password",
                onPressed: _resetPassword,
              ).setVerticalPadding(context, value: 0.02.height),
            ],
          ).setHorizontalPadding(context, value: 20),
        ),
      ),
    );
  }
}
