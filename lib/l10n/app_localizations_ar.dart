// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get map => 'الخريطة';

  @override
  String get favorites => 'المفضلة';

  @override
  String get profile => 'الحساب';

  @override
  String get searchForEvent => 'ابحث عن حدث';

  @override
  String get somethingWentWrong => 'حدث خطأ ما..';

  @override
  String get noEventsAvailable => 'لا توجد أحداث متاحة';

  @override
  String errorWithMessage(Object error) {
    return 'خطأ: $error';
  }

  @override
  String get noUserDataFound => 'لم يتم العثور على بيانات المستخدم';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'المظهر';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get welcomeBack => 'مرحباً بعودتك';

  @override
  String get cairoEgypt => 'القاهرة، مصر';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categorySports => 'رياضة';

  @override
  String get categoryBirthdays => 'أعياد ميلاد';

  @override
  String get categoryBookClub => 'نادي الكتاب';

  @override
  String get categoryMeetings => 'اجتماعات';

  @override
  String get categoryGaming => 'ألعاب';

  @override
  String get categoryHolidays => 'عطلات';

  @override
  String get categoryWorkshops => 'ورش عمل';

  @override
  String get categoryExhibitions => 'معارض';

  @override
  String get mapTapToSelect => 'اضغط على الموقع للاختيار';

  @override
  String get settingsLabel => 'الإعدادات';

  @override
  String get unableToGetLocation => 'تعذر الحصول على موقعك الحالي.';

  @override
  String get eventDetails => 'تفاصيل الحدث';

  @override
  String get eventDeletedSuccessfully => 'تم حذف الحدث بنجاح';

  @override
  String get failedToDeleteEvent => 'فشل حذف الحدث';

  @override
  String locationLabel(String location) {
    return 'الموقع: $location';
  }

  @override
  String get chooseEventLocation => 'اختر موقع الحدث';

  @override
  String get description => 'الوصف';

  @override
  String get deleteEvent => 'حذف الحدث';

  @override
  String get deleteEventConfirmation => 'هل أنت متأكد أنك تريد حذف هذا الحدث؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get editEvent => 'تعديل الحدث';

  @override
  String get titleLabel => 'العنوان';

  @override
  String get eventTitleHint => 'عنوان الحدث';

  @override
  String get eventDescriptionHint => 'وصف الحدث';

  @override
  String get eventDate => 'تاريخ الحدث';

  @override
  String get updateEvent => 'تحديث الحدث';

  @override
  String get eventUpdatedSuccessfully => 'تم تحديث الحدث بنجاح';

  @override
  String get failedToUpdateEvent => 'فشل تحديث الحدث';

  @override
  String get createEvent => 'إنشاء حدث';

  @override
  String get chooseDate => 'اختر التاريخ';

  @override
  String get addEvent => 'إضافة حدث';

  @override
  String get eventCreatedSuccessfully => 'تم إنشاء الحدث بنجاح';

  @override
  String get mustSelectEventDate => 'يجب عليك اختيار تاريخ الحدث';

  @override
  String get onboardingPersonalizeTitle => 'خصص تجربتك';

  @override
  String get onboardingPersonalizeDesc =>
      'اختر المظهر واللغة المفضلين لديك للبدء بتجربة مريحة ومخصصة تناسب أسلوبك.';

  @override
  String get onboardingInspireTitle => 'اكتشف الأحداث التي تلهمك';

  @override
  String get onboardingInspireDesc =>
      'انغمس في عالم من الأحداث المصممة لتناسب اهتماماتك الفريدة. سواء كنت من محبي الموسيقى الحية، أو ورش العمل الفنية، أو التواصل المهني، أو ببساطة اكتشاف تجارب جديدة، لدينا ما يناسب الجميع. توصياتنا المختارة بعناية ستساعدك على الاستكشاف والتواصل والاستفادة القصوى من كل فرصة من حولك.';

  @override
  String get onboardingPlanningTitle => 'تخطيط سهل للأحداث';

  @override
  String get onboardingPlanningDesc =>
      'تخلص من متاعب تنظيم الأحداث بأدواتنا الشاملة للتخطيط. من إعداد الدعوات وإدارة الردود إلى جدولة التذكيرات وتنسيق التفاصيل، نحن نغطي كل شيء. خطط بسهولة وركز على ما يهم – صنع تجربة لا تُنسى لك ولضيوفك.';

  @override
  String get onboardingShareTitle => 'تواصل مع الأصدقاء وشارك اللحظات';

  @override
  String get onboardingShareDesc =>
      'اجعل كل حدث لا يُنسى من خلال مشاركة التجربة مع الآخرين. تتيح لك منصتنا دعوة الأصدقاء وإبقاء الجميع على اطلاع والاحتفال باللحظات معًا. التقط الحماس وشاركه مع شبكتك، لتتمكن من إعادة عيش أبرز اللحظات واعتزازها.';

  @override
  String get letsStart => 'لنبدأ';

  @override
  String get emailHint => 'البريد الإلكتروني';

  @override
  String get passwordHint => 'كلمة المرور';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صالح';

  @override
  String get wrongPassword => 'كلمة مرور خاطئة';

  @override
  String get pleaseEnterEmail => 'الرجاء إدخال بريدك الإلكتروني';

  @override
  String get pleaseEnterPassword => 'الرجاء إدخال كلمة المرور';

  @override
  String get forgetPasswordQuestion => 'هل نسيت كلمة المرور؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get continueWithGoogle => 'المتابعة باستخدام جوجل';

  @override
  String get forgetPassword => 'نسيت كلمة المرور';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordResetLinkSent =>
      'تم إرسال رابط إعادة تعيين كلمة المرور\nإلى بريدك الإلكتروني';

  @override
  String get register => 'التسجيل';

  @override
  String get nameHint => 'الاسم';

  @override
  String get rePasswordHint => 'تأكيد كلمة المرور';

  @override
  String get pleaseEnterName => 'الرجاء إدخال اسمك';

  @override
  String get pleaseEnterValidEmail => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get pleaseEnterAPassword => 'الرجاء إدخال كلمة مرور';

  @override
  String get passwordTooShort => 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';

  @override
  String get passwordDoesNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get creatingAccount => 'جارٍ إنشاء الحساب...';

  @override
  String get accountCreatedSuccessfully => 'تم إنشاء الحساب بنجاح';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get invalidEmailFormat => 'صيغة البريد الإلكتروني غير صحيحة';

  @override
  String get wrongPasswordShort => 'كلمة مرور خاطئة';

  @override
  String get accountCreatedSuccessfullyAuth => 'تم إنشاء الحساب بنجاح';

  @override
  String get passwordTooWeak => 'كلمة المرور المُدخلة ضعيفة جدًا';

  @override
  String get emailAlreadyInUse => 'يوجد حساب بالفعل بهذا البريد الإلكتروني';

  @override
  String get emailBadlyFormatted => 'صيغة البريد الإلكتروني غير صحيحة';

  @override
  String get unexpectedErrorOccurred => 'حدث خطأ غير متوقع';

  @override
  String unexpectedPlatformError(String details) {
    return 'حدث خطأ غير متوقع في المنصة: $details';
  }

  @override
  String get loggedInSuccessfully => 'تم تسجيل الدخول بنجاح';

  @override
  String get noUserFoundForEmail =>
      'لم يتم العثور على مستخدم بهذا البريد الإلكتروني';

  @override
  String get wrongPasswordForUser =>
      'كلمة المرور المُدخلة لهذا المستخدم غير صحيحة';

  @override
  String get loggedOutSuccessfully => 'تم تسجيل الخروج بنجاح';

  @override
  String get errorWhileLoggingOut => 'حدث خطأ أثناء تسجيل الخروج';

  @override
  String get googleSignInCancelled => 'تم إلغاء تسجيل الدخول عبر جوجل';

  @override
  String get signedInWithGoogleSuccessfully => 'تم تسجيل الدخول بنجاح عبر جوجل';

  @override
  String get googleSignInFailed => 'فشل تسجيل الدخول عبر جوجل';
}
