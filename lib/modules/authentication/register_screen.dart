import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/user_info_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/services/firebase_authentication_services.dart';
import '../../core/services/firebase_firestore_services.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  late FirebaseFirestoreServices firebaseFirestoreServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          context.l10n.register,
          style: AppTextStyles.styleMedium20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor, // Set color here
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            30.setVerticalSpace(),
            Image.asset(
              AppImages.imagesLogo,
              height: 0.22.height,
              width: 0.34.width,
            ).setToCenter(),
            CustomTextFormField(
              hintText: context.l10n.nameHint,
              prefixIcn: SvgPicture.asset(
                AppIcons.iconsPerson,
                height: 5,
              ),
              controller: nameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.l10n.pleaseEnterName;
                }
                return null;
              },
            ).setVerticalPadding(context, value: 0.02.height),
            CustomTextFormField(
              hintText: context.l10n.emailHint,
              prefixIcn: SvgPicture.asset(
                AppIcons.iconsEmail,
                height: 5,
              ),
              controller: emailController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.l10n.pleaseEnterEmail;
                }
                if (!Validations.validateEmail(value)) {
                  return context.l10n.pleaseEnterValidEmail;
                }
                return null;
              },
            ).setVerticalPadding(context, value: 0.02.height),
            CustomTextFormField(
              hintText: context.l10n.passwordHint,
              prefixIcn: SvgPicture.asset(
                AppIcons.iconsLock,
                height: 5,
              ),
              isPassword: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.l10n.pleaseEnterAPassword;
                }
                if (!Validations.validatePassword(value)) {
                  return context.l10n.passwordTooShort;
                }
                return null;
              },
            ).setVerticalPadding(context, value: 0.02.height),
            CustomTextFormField(
              hintText: context.l10n.rePasswordHint,
              prefixIcn: SvgPicture.asset(
                AppIcons.iconsLock,
                height: 5,
              ),
              isPassword: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.l10n.pleaseEnterPassword;
                }
                if (value != passwordController.text) {
                  return context.l10n.passwordDoesNotMatch;
                }
                return null;
              },
            ).setVerticalPadding(context, value: 0.02.height),
            SizedBox(
                height: 0.07.height,
                child: CustomElevatedButton(
                    text: context.l10n.createAccount,
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        EasyLoading.show(status: context.l10n.creatingAccount);
                        FirebaseAuthServices.createAccount(
                          email: emailController.text,
                          password: passwordController.text,
                        ).then((value) async {
                          EasyLoading.dismiss();

                          if (value == true) {
                            String userId =
                                FirebaseAuth.instance.currentUser!.uid;

                            UserInformationModel userInformation =
                                UserInformationModel(
                              name: nameController.text,
                              email: emailController.text,
                            );

                            await FirebaseFirestoreServices
                                .createUserInformation(userId, userInformation);

                            navigatorKey.currentContext!.removeAllAndPushNamed(
                                routeName: ScreensRouteNames.loginRoute);
                          } else {
                            SnackBarService.showSuccessMessage(
                                context.l10n.accountCreatedSuccessfully);
                          }
                        });
                      }
                    })).setVerticalPadding(
              context,
              value: 0.02.height,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                  text: context.l10n.alreadyHaveAccount,
                  style: AppTextStyles.styleMedium16(context)
                      .copyWith(color: AppColors.black),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      context.goToNamed(
                          routeName: ScreensRouteNames.loginRoute);
                    },
                    child: Text(
                      context.l10n.login,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.italic,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            // const LanguageChoiceContainer().setVerticalPadding(
            //   context,
            //   value: 0.02.height,
            // ),
          ]).setHorizontalPadding(context, value: 20),
        ),
      ),
    );
  }
}
