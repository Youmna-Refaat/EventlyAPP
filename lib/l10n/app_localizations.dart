import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @searchForEvent.
  ///
  /// In en, this message translates to:
  /// **'Search for Event'**
  String get searchForEvent;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong..'**
  String get somethingWentWrong;

  /// No description provided for @noEventsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No events available'**
  String get noEventsAvailable;

  /// No description provided for @errorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithMessage(Object error);

  /// No description provided for @noUserDataFound.
  ///
  /// In en, this message translates to:
  /// **'No user data found'**
  String get noUserDataFound;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @cairoEgypt.
  ///
  /// In en, this message translates to:
  /// **'Cairo , Egypt'**
  String get cairoEgypt;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categorySports;

  /// No description provided for @categoryBirthdays.
  ///
  /// In en, this message translates to:
  /// **'Birthdays'**
  String get categoryBirthdays;

  /// No description provided for @categoryBookClub.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get categoryBookClub;

  /// No description provided for @categoryMeetings.
  ///
  /// In en, this message translates to:
  /// **'Meetings'**
  String get categoryMeetings;

  /// No description provided for @categoryGaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get categoryGaming;

  /// No description provided for @categoryHolidays.
  ///
  /// In en, this message translates to:
  /// **'Holidays'**
  String get categoryHolidays;

  /// No description provided for @categoryWorkshops.
  ///
  /// In en, this message translates to:
  /// **'Workshops'**
  String get categoryWorkshops;

  /// No description provided for @categoryExhibitions.
  ///
  /// In en, this message translates to:
  /// **'Exhibitions'**
  String get categoryExhibitions;

  /// No description provided for @mapTapToSelect.
  ///
  /// In en, this message translates to:
  /// **'Tap on Location To Select'**
  String get mapTapToSelect;

  /// No description provided for @settingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsLabel;

  /// No description provided for @unableToGetLocation.
  ///
  /// In en, this message translates to:
  /// **'Unable to get your current location.'**
  String get unableToGetLocation;

  /// No description provided for @eventDetails.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventDetails;

  /// No description provided for @eventDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event deleted successfully'**
  String get eventDeletedSuccessfully;

  /// No description provided for @failedToDeleteEvent.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete event'**
  String get failedToDeleteEvent;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location: {location}'**
  String locationLabel(String location);

  /// No description provided for @chooseEventLocation.
  ///
  /// In en, this message translates to:
  /// **'Choose Event Location'**
  String get chooseEventLocation;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @deleteEvent.
  ///
  /// In en, this message translates to:
  /// **'Delete Event'**
  String get deleteEvent;

  /// No description provided for @deleteEventConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this event?'**
  String get deleteEventConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @editEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get editEvent;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @eventTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventTitleHint;

  /// No description provided for @eventDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get eventDescriptionHint;

  /// No description provided for @eventDate.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventDate;

  /// No description provided for @updateEvent.
  ///
  /// In en, this message translates to:
  /// **'Update Event'**
  String get updateEvent;

  /// No description provided for @eventUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event Updated Successfully'**
  String get eventUpdatedSuccessfully;

  /// No description provided for @failedToUpdateEvent.
  ///
  /// In en, this message translates to:
  /// **'Failed to update event'**
  String get failedToUpdateEvent;

  /// No description provided for @createEvent.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get createEvent;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get chooseDate;

  /// No description provided for @addEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get addEvent;

  /// No description provided for @eventCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Event was created successfully'**
  String get eventCreatedSuccessfully;

  /// No description provided for @mustSelectEventDate.
  ///
  /// In en, this message translates to:
  /// **'You must select event date'**
  String get mustSelectEventDate;

  /// No description provided for @onboardingPersonalizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get onboardingPersonalizeTitle;

  /// No description provided for @onboardingPersonalizeDesc.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get onboardingPersonalizeDesc;

  /// No description provided for @onboardingInspireTitle.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get onboardingInspireTitle;

  /// No description provided for @onboardingInspireDesc.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get onboardingInspireDesc;

  /// No description provided for @onboardingPlanningTitle.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get onboardingPlanningTitle;

  /// No description provided for @onboardingPlanningDesc.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we\'ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get onboardingPlanningDesc;

  /// No description provided for @onboardingShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get onboardingShareTitle;

  /// No description provided for @onboardingShareDesc.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get onboardingShareDesc;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Lets Start'**
  String get letsStart;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'invalid email'**
  String get invalidEmail;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'wrong password'**
  String get wrongPassword;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// No description provided for @forgetPasswordQuestion.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPasswordQuestion;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Dont have an account? '**
  String get dontHaveAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @passwordResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link\nsent to your email'**
  String get passwordResetLinkSent;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameHint;

  /// No description provided for @rePasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re Password'**
  String get rePasswordHint;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterAPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get pleaseEnterAPassword;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordDoesNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get passwordDoesNotMatch;

  /// No description provided for @creatingAccount.
  ///
  /// In en, this message translates to:
  /// **'Creating Account...'**
  String get creatingAccount;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmailFormat;

  /// No description provided for @wrongPasswordShort.
  ///
  /// In en, this message translates to:
  /// **'Wrong password'**
  String get wrongPasswordShort;

  /// No description provided for @accountCreatedSuccessfullyAuth.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountCreatedSuccessfullyAuth;

  /// No description provided for @passwordTooWeak.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak'**
  String get passwordTooWeak;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email'**
  String get emailAlreadyInUse;

  /// No description provided for @emailBadlyFormatted.
  ///
  /// In en, this message translates to:
  /// **'The email address is badly formatted'**
  String get emailBadlyFormatted;

  /// No description provided for @unexpectedErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get unexpectedErrorOccurred;

  /// No description provided for @unexpectedPlatformError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected platform error occurred: {details}'**
  String unexpectedPlatformError(String details);

  /// No description provided for @loggedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged in Successfully'**
  String get loggedInSuccessfully;

  /// No description provided for @noUserFoundForEmail.
  ///
  /// In en, this message translates to:
  /// **'No user found for that email'**
  String get noUserFoundForEmail;

  /// No description provided for @wrongPasswordForUser.
  ///
  /// In en, this message translates to:
  /// **'Wrong password provided for that user'**
  String get wrongPasswordForUser;

  /// No description provided for @loggedOutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get loggedOutSuccessfully;

  /// No description provided for @errorWhileLoggingOut.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while logging out'**
  String get errorWhileLoggingOut;

  /// No description provided for @googleSignInCancelled.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In cancelled'**
  String get googleSignInCancelled;

  /// No description provided for @signedInWithGoogleSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Google successfully'**
  String get signedInWithGoogleSuccessfully;

  /// No description provided for @googleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In failed'**
  String get googleSignInFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
