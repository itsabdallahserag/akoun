import 'package:akoun/l10n/app_localizations.dart';

abstract final class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$",
  );
  static final RegExp _nameRegExp = RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$');
  static final RegExp _egPhoneRegExp = RegExp(r'^01[0125][0-9]{8}$');

  static bool _isEmpty(String? val) => val == null || val.trim().isEmpty;

  static String? validateName(String? val, AppLocalizations l10n) {
    if (_isEmpty(val)) return l10n.validationRequired;
    final name = val!.trim();
    if (name.length < 3) return l10n.validationNameMin3;
    if (!_nameRegExp.hasMatch(name)) return l10n.validationNameLettersOnly;
    return null;
  }

  static String? validateEmail(String? val, AppLocalizations l10n) {
    if (_isEmpty(val)) return l10n.validationRequired;
    if (!_emailRegExp.hasMatch(val!.trim())) return l10n.validationEmailInvalid;
    return null;
  }

  static String? validatePhoneNumber(String? val, AppLocalizations l10n) {
    if (_isEmpty(val)) return l10n.validationRequired;
    if (!_egPhoneRegExp.hasMatch(val!.trim())) {
      return l10n.validationPhoneInvalid;
    }
    return null;
  }

  static String? validateChildName(String? val, AppLocalizations l10n) {
    if (_isEmpty(val)) return l10n.validationRequired;
    final name = val!.trim();
    if (name.length < 2) return l10n.validationNameMin2;
    if (!_nameRegExp.hasMatch(name)) return l10n.validationNameLettersOnly;
    return null;
  }

  static String? validateChildAge(String? val, AppLocalizations l10n) {
    if (_isEmpty(val)) return l10n.validationRequired;
    final age = int.tryParse(val!.trim());
    if (age == null) return l10n.validationAgeInvalidNumber;
    if (age < 3 || age > 12) return l10n.validationAgeRange;
    return null;
  }
}