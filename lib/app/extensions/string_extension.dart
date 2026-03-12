import 'package:email_validator/email_validator.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

extension EmailValidators on String {
  bool isValidEmail() {
    String email = this;
    if (email.indexOf('@') > 0 &&
        email.substring(indexOf('@')).indexOf('_') > 0) {
      String substringAfterMail = email.substring(
        indexOf('@'),
        email.lastIndexOf('.'),
      );
      String replaceSymbols = substringAfterMail.replaceAll(
        RegExp(r'[_.]'),
        '',
      );
      email =
          email.substring(0, indexOf('@')) +
          replaceSymbols +
          email.substring(email.lastIndexOf('.'));
    }
    bool validator = EmailValidator.validate(email);
    String endSubstringEmail = '';
    if (!validator && email.indexOf('@') > 0) {
      endSubstringEmail = email.substring(indexOf('@'));
      if (endSubstringEmail.indexOf('_') > 0) return true;
    }
    if (validator) {
      if (email.length > 320) {
        return false;
      }
      String substringLastDot = email.substring(email.lastIndexOf('.') + 1);
      if (substringLastDot.length < 2 || substringLastDot.length > 63) {
        return false;
      }
    }
    return validator;
  }
}

extension PasswordValidator on String {
  String? isValidPassword() {
    bool validCharacters = RegExp(r'^[a-zA-Z0-9@!#&*~$\\\-]+$').hasMatch(this);
    if (trim().length < 8) {
      return Strings.passwordMustContainAtLeast8Cha.tr;
    } else if (!validCharacters) {
      return Strings.passwordCanOnlyContainNumbersL.tr;
    }
    return null;
  }
}
