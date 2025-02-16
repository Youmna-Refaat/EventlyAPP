import 'package:flutter/material.dart';
import '../../modules/authentication/forget_password_screen.dart';
import '../../modules/authentication/log_in_screen.dart';
import '../../modules/authentication/register_screen.dart';
import '../../modules/event/create_event_screen.dart';
import '../../modules/event/edit_event_screen.dart';
import '../../modules/event/event_details_screen.dart';
import '../../modules/event/event_location_screen.dart';
import '../../modules/layouts/home/home_tab.dart';
import '../../modules/layouts/layout.dart';
import '../../modules/layouts/favourite/favourite_tab.dart';
import '../../modules/layouts/map/map_tab.dart';
import '../../modules/layouts/profile/profile_tab.dart';
import '../../modules/onBoarding/onboarding_layout.dart';
import '../../modules/onBoarding/onboarding_start.dart';
import '../../modules/splash/splash_screen.dart';

import 'screens_route_names.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreensRouteNames.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case ScreensRouteNames.onBoardingStartRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingStart(),
          settings: settings,
        );
      case ScreensRouteNames.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingLayout(),
          settings: settings,
        );
      case ScreensRouteNames.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LogInScreen(),
          settings: settings,
        );
      case ScreensRouteNames.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );
      case ScreensRouteNames.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case ScreensRouteNames.layoutRoute:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
          settings: settings,
        );
      case ScreensRouteNames.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case ScreensRouteNames.mapRoute:
        return MaterialPageRoute(
          builder: (context) => const MapScreen(),
          settings: settings,
        );
      case ScreensRouteNames.favouritesRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
          settings: settings,
        );
      case ScreensRouteNames.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: settings,
        );
      case ScreensRouteNames.createEventRoute:
        return MaterialPageRoute(
          builder: (context) => const CreateEventScreen(),
          settings: settings,
        );
      case ScreensRouteNames.eventDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const EventDetailsScreen(),
          settings: settings,
        );
      case ScreensRouteNames.editEventRoute:
        return MaterialPageRoute(
          builder: (context) => const EditEventScreen(),
          settings: settings,
        );
      case ScreensRouteNames.eventLocationRoute:
        return MaterialPageRoute(
          builder: (context) => const EventLocationScreen(),
          settings: settings,
        );
      case ScreensRouteNames.eventLocationMapRoute:
        return MaterialPageRoute(
          builder: (context) => const EventLocationScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
