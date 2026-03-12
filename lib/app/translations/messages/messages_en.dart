import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:fymoney/app/translations/tr_strings.dart';

class MessagesEn extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_EN': {
      Strings.signIn: '''Sign in''',
      Strings.login: '''Login''',
      Strings.email: '''Email''',
      Strings.password: '''Password''',
      Strings.repeatePassword: '''Repeate password''',
      Strings.register: '''Register''',
      Strings.createAccount: '''Create account''',
      Strings.logIn: '''Log In''',
      Strings.passwordCanOnlyContainNumbersL:
          '''Password can only contain numbers, letters and @!#&*~\$-''',
      Strings.passwordMustContainAtLeast8Cha:
          '''Password must contain at least 8 characters''',
      Strings.theFieldMustBeFilled: '''The field must be filled''',
      Strings.pleaseUseAValidEmail: '''Please use a valid email''',
      Strings.passwordsDoNotMatch: '''Passwords do not match.''',
      Strings.emailAlreadyInUse: '''Email already in use''',
      Strings.earning: '''Earning''',
          Strings.spending: '''Spending''',
        },
  };
}
