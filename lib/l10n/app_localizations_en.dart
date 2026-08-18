// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get map => 'Map';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String get searchForEvent => 'Search for Event';

  @override
  String get somethingWentWrong => 'Something went wrong..';

  @override
  String get noEventsAvailable => 'No events available';

  @override
  String errorWithMessage(Object error) {
    return 'Error: $error';
  }

  @override
  String get noUserDataFound => 'No user data found';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get logout => 'Logout';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get cairoEgypt => 'Cairo , Egypt';

  @override
  String get categoryAll => 'All';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryBirthdays => 'Birthdays';

  @override
  String get categoryBookClub => 'Book Club';

  @override
  String get categoryMeetings => 'Meetings';

  @override
  String get categoryGaming => 'Gaming';

  @override
  String get categoryHolidays => 'Holidays';

  @override
  String get categoryWorkshops => 'Workshops';

  @override
  String get categoryExhibitions => 'Exhibitions';

  @override
  String get mapTapToSelect => 'Tap on Location To Select';

  @override
  String get settingsLabel => 'Settings';

  @override
  String get unableToGetLocation => 'Unable to get your current location.';

  @override
  String get eventDetails => 'Event Details';

  @override
  String get eventDeletedSuccessfully => 'Event deleted successfully';

  @override
  String get failedToDeleteEvent => 'Failed to delete event';

  @override
  String locationLabel(String location) {
    return 'Location: $location';
  }

  @override
  String get chooseEventLocation => 'Choose Event Location';

  @override
  String get description => 'Description';

  @override
  String get deleteEvent => 'Delete Event';

  @override
  String get deleteEventConfirmation =>
      'Are you sure you want to delete this event?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get editEvent => 'Edit Event';

  @override
  String get titleLabel => 'Title';

  @override
  String get eventTitleHint => 'Event Title';

  @override
  String get eventDescriptionHint => 'Event Description';

  @override
  String get eventDate => 'Event Date';

  @override
  String get updateEvent => 'Update Event';

  @override
  String get eventUpdatedSuccessfully => 'Event Updated Successfully';

  @override
  String get failedToUpdateEvent => 'Failed to update event';

  @override
  String get createEvent => 'Create Event';

  @override
  String get chooseDate => 'Choose Date';

  @override
  String get addEvent => 'Add Event';

  @override
  String get eventCreatedSuccessfully => 'Event was created successfully';

  @override
  String get mustSelectEventDate => 'You must select event date';

  @override
  String get onboardingPersonalizeTitle => 'Personalize Your Experience';

  @override
  String get onboardingPersonalizeDesc =>
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.';

  @override
  String get onboardingInspireTitle => 'Find Events That Inspire You';

  @override
  String get onboardingInspireDesc =>
      'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.';

  @override
  String get onboardingPlanningTitle => 'Effortless Event Planning';

  @override
  String get onboardingPlanningDesc =>
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we\'ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.';

  @override
  String get onboardingShareTitle => 'Connect with Friends & Share Moments';

  @override
  String get onboardingShareDesc =>
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.';

  @override
  String get letsStart => 'Lets Start';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get invalidEmail => 'invalid email';

  @override
  String get wrongPassword => 'wrong password';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get forgetPasswordQuestion => 'Forget Password?';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAccount => 'Dont have an account? ';

  @override
  String get createAccount => 'Create Account';

  @override
  String get or => 'Or';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get passwordResetLinkSent => 'Password reset link\nsent to your email';

  @override
  String get register => 'Register';

  @override
  String get nameHint => 'Name';

  @override
  String get rePasswordHint => 'Re Password';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterAPassword => 'Please enter a password';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get passwordDoesNotMatch => 'Password does not match';

  @override
  String get creatingAccount => 'Creating Account...';

  @override
  String get accountCreatedSuccessfully => 'Account created successfully';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get invalidEmailFormat => 'Invalid email format';

  @override
  String get wrongPasswordShort => 'Wrong password';

  @override
  String get accountCreatedSuccessfullyAuth => 'Account Created Successfully';

  @override
  String get passwordTooWeak => 'The password provided is too weak';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email';

  @override
  String get emailBadlyFormatted => 'The email address is badly formatted';

  @override
  String get unexpectedErrorOccurred => 'An unexpected error occurred';

  @override
  String unexpectedPlatformError(String details) {
    return 'An unexpected platform error occurred: $details';
  }

  @override
  String get loggedInSuccessfully => 'Logged in Successfully';

  @override
  String get noUserFoundForEmail => 'No user found for that email';

  @override
  String get wrongPasswordForUser => 'Wrong password provided for that user';

  @override
  String get loggedOutSuccessfully => 'Logged out successfully';

  @override
  String get errorWhileLoggingOut => 'An error occurred while logging out';

  @override
  String get googleSignInCancelled => 'Google Sign-In cancelled';

  @override
  String get signedInWithGoogleSuccessfully =>
      'Signed in with Google successfully';

  @override
  String get googleSignInFailed => 'Google Sign-In failed';
}
