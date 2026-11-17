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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
  ];

  /// No description provided for @appTagline.
  ///
  /// In ar, this message translates to:
  /// **'أكون ... بالقراءة أكون'**
  String get appTagline;

  /// No description provided for @startAdventure.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ المغامرة'**
  String get startAdventure;

  /// No description provided for @createAccount.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get createAccount;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @welcomeTitle.
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك في أكون!'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'لنبدأ مغامرة القراءة الممتعة'**
  String get welcomeSubtitle;

  /// No description provided for @heroName.
  ///
  /// In ar, this message translates to:
  /// **'اسم البطل'**
  String get heroName;

  /// No description provided for @whatIsYourName.
  ///
  /// In ar, this message translates to:
  /// **'ما اسمك؟'**
  String get whatIsYourName;

  /// No description provided for @parentsSection.
  ///
  /// In ar, this message translates to:
  /// **'قسم الوالدين'**
  String get parentsSection;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phoneNumber;

  /// No description provided for @letsStart.
  ///
  /// In ar, this message translates to:
  /// **'هيا بنا نبدأ'**
  String get letsStart;

  /// No description provided for @childName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الطفل'**
  String get childName;

  /// No description provided for @enterChildName.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الطفل'**
  String get enterChildName;

  /// No description provided for @howOldAreYou.
  ///
  /// In ar, this message translates to:
  /// **'كم عمرك؟'**
  String get howOldAreYou;

  /// No description provided for @age.
  ///
  /// In ar, this message translates to:
  /// **'العمر'**
  String get age;

  /// No description provided for @gender.
  ///
  /// In ar, this message translates to:
  /// **'النوع'**
  String get gender;

  /// No description provided for @girl.
  ///
  /// In ar, this message translates to:
  /// **'بنت'**
  String get girl;

  /// No description provided for @boy.
  ///
  /// In ar, this message translates to:
  /// **'ولد'**
  String get boy;

  /// No description provided for @guideData.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الموجّه'**
  String get guideData;

  /// No description provided for @chooseGuide.
  ///
  /// In ar, this message translates to:
  /// **'اختر من سيوجه رحلتك التعليمية'**
  String get chooseGuide;

  /// No description provided for @femaleTeacher.
  ///
  /// In ar, this message translates to:
  /// **'معلمة'**
  String get femaleTeacher;

  /// No description provided for @female.
  ///
  /// In ar, this message translates to:
  /// **'أنثى'**
  String get female;

  /// No description provided for @maleTeacher.
  ///
  /// In ar, this message translates to:
  /// **'معلم'**
  String get maleTeacher;

  /// No description provided for @male.
  ///
  /// In ar, this message translates to:
  /// **'ذكر'**
  String get male;

  /// No description provided for @chooseLanguage.
  ///
  /// In ar, this message translates to:
  /// **'اختر لغتك'**
  String get chooseLanguage;

  /// No description provided for @languageArabic.
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @languageEnglish.
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTurkish.
  ///
  /// In ar, this message translates to:
  /// **'Türkçe'**
  String get languageTurkish;

  /// No description provided for @languageUrdu.
  ///
  /// In ar, this message translates to:
  /// **'اردو'**
  String get languageUrdu;

  /// No description provided for @chooseDialect.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللهجة المفضلة'**
  String get chooseDialect;

  /// No description provided for @dialectGulf.
  ///
  /// In ar, this message translates to:
  /// **'خليجي'**
  String get dialectGulf;

  /// No description provided for @dialectEgyptian.
  ///
  /// In ar, this message translates to:
  /// **'مصري'**
  String get dialectEgyptian;

  /// No description provided for @dialectStandard.
  ///
  /// In ar, this message translates to:
  /// **'فصحى'**
  String get dialectStandard;

  /// No description provided for @guideWelcome.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بك في أكون !\nسأكون معلمك ومساعدك\nفي رحلتك للتعلم وتصبح\nبطلاً في القراءة'**
  String get guideWelcome;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @validationRequired.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get validationRequired;

  /// No description provided for @validationNameMin3.
  ///
  /// In ar, this message translates to:
  /// **'الاسم يجب ألا يقل عن 3 أحرف'**
  String get validationNameMin3;

  /// No description provided for @validationNameMin2.
  ///
  /// In ar, this message translates to:
  /// **'الاسم يجب ألا يقل عن حرفين'**
  String get validationNameMin2;

  /// No description provided for @validationNameLettersOnly.
  ///
  /// In ar, this message translates to:
  /// **'الاسم يجب أن يحتوي على حروف فقط'**
  String get validationNameLettersOnly;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In ar, this message translates to:
  /// **'أدخل بريدًا إلكترونيًا صحيحًا'**
  String get validationEmailInvalid;

  /// No description provided for @validationPhoneInvalid.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم هاتف صحيحًا مكونًا من 11 رقمًا'**
  String get validationPhoneInvalid;

  /// No description provided for @validationAgeInvalidNumber.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقمًا صحيحًا'**
  String get validationAgeInvalidNumber;

  /// No description provided for @validationAgeRange.
  ///
  /// In ar, this message translates to:
  /// **'العمر يجب أن يكون بين 3 و12 سنة'**
  String get validationAgeRange;

  /// No description provided for @homeGreeting.
  ///
  /// In ar, this message translates to:
  /// **'صباح الخير يا {name} !'**
  String homeGreeting(String name);

  /// No description provided for @homeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'هيا نكمل رحلتنا التعليمية'**
  String get homeSubtitle;

  /// No description provided for @islandLetters.
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الحروف'**
  String get islandLetters;

  /// No description provided for @islandHarakat.
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الحركات'**
  String get islandHarakat;

  /// No description provided for @islandMadd.
  ///
  /// In ar, this message translates to:
  /// **'جزيرة حروف المد'**
  String get islandMadd;

  /// No description provided for @islandWords.
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الكلمات'**
  String get islandWords;

  /// No description provided for @islandSentences.
  ///
  /// In ar, this message translates to:
  /// **'جزيرة الجمل والقواعد'**
  String get islandSentences;

  /// No description provided for @bigTreasure.
  ///
  /// In ar, this message translates to:
  /// **'الكنز الكبير'**
  String get bigTreasure;

  /// No description provided for @islandLocked.
  ///
  /// In ar, this message translates to:
  /// **'أكمل الجزيرة السابقة لتفتح هذه الجزيرة'**
  String get islandLocked;

  /// No description provided for @continueText.
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueText;

  /// No description provided for @learnLetter.
  ///
  /// In ar, this message translates to:
  /// **'تعلم الحرف'**
  String get learnLetter;

  /// No description provided for @remember.
  ///
  /// In ar, this message translates to:
  /// **'تذكر'**
  String get remember;

  /// No description provided for @pronunciationTraining.
  ///
  /// In ar, this message translates to:
  /// **'تدريب النطق'**
  String get pronunciationTraining;

  /// No description provided for @letsPracticePronunciation.
  ///
  /// In ar, this message translates to:
  /// **'هيا لتقييم النطق'**
  String get letsPracticePronunciation;

  /// No description provided for @listeningTraining.
  ///
  /// In ar, this message translates to:
  /// **'تدريب الاستماع'**
  String get listeningTraining;

  /// No description provided for @listenAndChooseCorrectLetter.
  ///
  /// In ar, this message translates to:
  /// **'استمع ثم اختر الحرف الصحيح'**
  String get listenAndChooseCorrectLetter;

  /// No description provided for @wrongAnswerTryAgain.
  ///
  /// In ar, this message translates to:
  /// **'اجابة خاطئة ، حاول مرة أخرى'**
  String get wrongAnswerTryAgain;

  /// No description provided for @wellDone.
  ///
  /// In ar, this message translates to:
  /// **'أحسنت'**
  String get wellDone;

  /// No description provided for @champion.
  ///
  /// In ar, this message translates to:
  /// **'أيها البطل'**
  String get champion;

  /// No description provided for @write.
  ///
  /// In ar, this message translates to:
  /// **'اكتب'**
  String get write;

  /// No description provided for @traceLetterWithDots.
  ///
  /// In ar, this message translates to:
  /// **'تتبع الحرف بالنقاط'**
  String get traceLetterWithDots;

  /// No description provided for @traceDotsToWrite.
  ///
  /// In ar, this message translates to:
  /// **'قم بتتبع النقاط لكتابة'**
  String get traceDotsToWrite;

  /// No description provided for @letterBehPositions.
  ///
  /// In ar, this message translates to:
  /// **'حرف الباء'**
  String get letterBehPositions;

  /// No description provided for @letterPositions.
  ///
  /// In ar, this message translates to:
  /// **'مواضع الحرف'**
  String get letterPositions;

  /// No description provided for @beginningOfWord.
  ///
  /// In ar, this message translates to:
  /// **'أول الكلمة'**
  String get beginningOfWord;

  /// No description provided for @middleOfWord.
  ///
  /// In ar, this message translates to:
  /// **'وسط الكلمة'**
  String get middleOfWord;

  /// No description provided for @endOfWord.
  ///
  /// In ar, this message translates to:
  /// **'آخر الكلمة'**
  String get endOfWord;

  /// No description provided for @matching.
  ///
  /// In ar, this message translates to:
  /// **'توصيل'**
  String get matching;

  /// No description provided for @matchLetterWithImage.
  ///
  /// In ar, this message translates to:
  /// **'صل الحرف بالصورة المناسبة'**
  String get matchLetterWithImage;

  /// No description provided for @okay.
  ///
  /// In ar, this message translates to:
  /// **'حسنا'**
  String get okay;

  /// No description provided for @rememberText.
  ///
  /// In ar, this message translates to:
  /// **'الحرف (ب) يخرج من الشفتين مع بعضهما وتكون مطلقة ثم تفتح صوت (ب)'**
  String get rememberText;
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
    'that was used.',
  );
}
