// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTagline => 'أكون ... بالقراءة أكون';

  @override
  String get startAdventure => 'ابدأ المغامرة';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get welcomeTitle => 'أهلاً بك في أكون!';

  @override
  String get welcomeSubtitle => 'لنبدأ مغامرة القراءة الممتعة';

  @override
  String get heroName => 'اسم البطل';

  @override
  String get whatIsYourName => 'ما اسمك؟';

  @override
  String get parentsSection => 'قسم الوالدين';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get letsStart => 'هيا بنا نبدأ';

  @override
  String get childName => 'اسم الطفل';

  @override
  String get enterChildName => 'اكتب اسم الطفل';

  @override
  String get howOldAreYou => 'كم عمرك؟';

  @override
  String get age => 'العمر';

  @override
  String get gender => 'النوع';

  @override
  String get girl => 'بنت';

  @override
  String get boy => 'ولد';

  @override
  String get guideData => 'بيانات الموجّه';

  @override
  String get chooseGuide => 'اختر من سيوجه رحلتك التعليمية';

  @override
  String get femaleTeacher => 'معلمة';

  @override
  String get female => 'أنثى';

  @override
  String get maleTeacher => 'معلم';

  @override
  String get male => 'ذكر';

  @override
  String get chooseLanguage => 'اختر لغتك';

  @override
  String get languageArabic => 'العربية';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageUrdu => 'اردو';

  @override
  String get chooseDialect => 'اختر اللهجة المفضلة';

  @override
  String get dialectGulf => 'خليجي';

  @override
  String get dialectEgyptian => 'مصري';

  @override
  String get dialectStandard => 'فصحى';

  @override
  String get guideWelcome =>
      'مرحبا بك في أكون !\nسأكون معلمك ومساعدك\nفي رحلتك للتعلم وتصبح\nبطلاً في القراءة';

  @override
  String get next => 'التالي';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationNameMin3 => 'الاسم يجب ألا يقل عن 3 أحرف';

  @override
  String get validationNameMin2 => 'الاسم يجب ألا يقل عن حرفين';

  @override
  String get validationNameLettersOnly => 'الاسم يجب أن يحتوي على حروف فقط';

  @override
  String get validationEmailInvalid => 'أدخل بريدًا إلكترونيًا صحيحًا';

  @override
  String get validationPhoneInvalid =>
      'أدخل رقم هاتف صحيحًا مكونًا من 11 رقمًا';

  @override
  String get validationAgeInvalidNumber => 'أدخل رقمًا صحيحًا';

  @override
  String get validationAgeRange => 'العمر يجب أن يكون بين 3 و12 سنة';

  @override
  String homeGreeting(String name) {
    return 'صباح الخير يا $name !';
  }

  @override
  String get homeSubtitle => 'هيا نكمل رحلتنا التعليمية';

  @override
  String get islandLetters => 'جزيرة الحروف';

  @override
  String get islandHarakat => 'جزيرة الحركات';

  @override
  String get islandMadd => 'جزيرة حروف المد';

  @override
  String get islandWords => 'جزيرة الكلمات';

  @override
  String get islandSentences => 'جزيرة الجمل والقواعد';

  @override
  String get bigTreasure => 'الكنز الكبير';

  @override
  String get islandLocked => 'أكمل الجزيرة السابقة لتفتح هذه الجزيرة';

  @override
  String get continueText => 'متابعة';

  @override
  String get learnLetter => 'تعلم الحرف';

  @override
  String get remember => 'تذكر';

  @override
  String get pronunciationTraining => 'تدريب النطق';

  @override
  String get letsPracticePronunciation => 'هيا لتقييم النطق';

  @override
  String get listeningTraining => 'تدريب الاستماع';

  @override
  String get listenAndChooseCorrectLetter => 'استمع ثم اختر الحرف الصحيح';

  @override
  String get wrongAnswerTryAgain => 'اجابة خاطئة ، حاول مرة أخرى';

  @override
  String get wellDone => 'أحسنت';

  @override
  String get champion => 'أيها البطل';

  @override
  String get write => 'اكتب';

  @override
  String get traceLetterWithDots => 'تتبع الحرف بالنقاط';

  @override
  String get traceDotsToWrite => 'قم بتتبع النقاط لكتابة';

  @override
  String get letterBehPositions => 'حرف الباء';

  @override
  String get letterPositions => 'مواضع الحرف';

  @override
  String get beginningOfWord => 'أول الكلمة';

  @override
  String get middleOfWord => 'وسط الكلمة';

  @override
  String get endOfWord => 'آخر الكلمة';

  @override
  String get matching => 'توصيل';

  @override
  String get matchLetterWithImage => 'صل الحرف بالصورة المناسبة';

  @override
  String get okay => 'حسنا';

  @override
  String get rememberText =>
      'الحرف (ب) يخرج من الشفتين مع بعضهما وتكون مطلقة ثم تفتح صوت (ب)';
}
