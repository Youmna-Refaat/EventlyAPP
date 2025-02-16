import 'dart:async';
import 'dart:developer';
import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/event_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/services/firebase_authentication_services.dart';
import '../../core/services/firebase_firestore_services.dart';
import '../../core/services/snack_bar_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_language_choice_container.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../main.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String userId = FirebaseAuthServices.currentUserId();
  String? errorMessage;
  Timer? _debounce;

  void _showSnackBarAfterDelay(String message) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      SnackBarService.showErrorMessage(message);
    });
  }

  Future<void> fetchUserEvents(String userId) async {
    try {
      List<EventDataModel> userEvents =
          await FirebaseFirestoreServices.getUserEvents(userId);

      navigatorKey.currentState!.pushReplacementNamed(
          ScreensRouteNames.layoutRoute,
          arguments: userEvents);
    } catch (e) {
      log("Error fetching user events: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              80.setVerticalSpace(),
              Image.asset(
                AppImages.imagesLogo,
                height: 0.22.height,
                width: 0.34.width,
              ).setToCenter(),
              15.setVerticalSpace(),
              CustomTextFormField(
                controller: emailController,
                hintText: "Email",
                onFieldSubmitted: (value) {
                  if (!Validations.validateEmail(value)) {
                    setState(() {
                      _showSnackBarAfterDelay("invalid email");
                    });
                  }
                },
                prefixIcn: SvgPicture.asset(
                  AppIcons.iconsEmail,
                  height: 5,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ).setVerticalPadding(context, value: 0.02.height),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Password",
                onFieldSubmitted: (value) {
                  if (!Validations.validatePassword(value)) {
                    setState(() {
                      _showSnackBarAfterDelay("wrong password");
                    });
                  }
                },
                prefixIcn: SvgPicture.asset(
                  AppIcons.iconsLock,
                  height: 5,
                ),
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ).setVerticalPadding(context, value: 0.02.height),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.goToNamed(
                    routeName: ScreensRouteNames.forgotPasswordRoute,
                  ),
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.07.height,
                child: CustomElevatedButton(
                    text: "Login",
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        FirebaseAuthServices.login(
                          email: emailController.text,
                          password: passwordController.text,
                        ).then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            String userId =
                                FirebaseAuthServices.currentUserId();
                            fetchUserEvents(userId);
                          }
                        });
                      }
                    }),
              ).setVerticalPadding(context, value: 0.02.height),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                    text: "Dont have an account? ",
                    style: AppTextStyles.styleMedium16(context)
                        .copyWith(color: AppColors.black),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        context.goToNamed(
                            routeName: ScreensRouteNames.registerRoute);
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
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
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      endIndent: 10,
                      indent: 10,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or",
                    style: AppTextStyles.styleMedium16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      endIndent: 10,
                      indent: 10,
                      thickness: 1,
                    ),
                  ),
                ],
              ).setVerticalPadding(context, value: 0.02.height),
              ElevatedButton(
                onPressed: () async {
                  bool success = await FirebaseAuthServices.signInWithGoogle();

                  if (success) {
                    String userId = FirebaseAuthServices.currentUserId();
                    fetchUserEvents(userId);
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side:
                      const BorderSide(color: AppColors.primaryColor, width: 1),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.iconsGoogle,
                      height: 25,
                      width: 20,
                    ).setVerticalPadding(context, value: 10),
                    20.setHorizontalSpace(),
                    Text(
                      "Continue with Google",
                      style: AppTextStyles.styleMedium20(context).copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ).setToCenter(),
                  ],
                ),
              ),
              const LanguageChoiceContainer().setVerticalPadding(
                context,
                value: 0.02.height,
              ),
            ]).setHorizontalPadding(context, value: 20),
          ),
        ),
      ),
    );
  }
}
