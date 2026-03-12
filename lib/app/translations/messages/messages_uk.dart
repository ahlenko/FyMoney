import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:fymoney/app/translations/tr_strings.dart';

class MessagesUk extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'uk_UA': {
      Strings.signIn: '''Реєстрація''',
      Strings.login: '''Увійти''',
      Strings.email: '''Email''',
      Strings.password: '''Пароль''',
      Strings.repeatePassword: '''Повторити пароль''',
      Strings.register: '''Зареєструватись''',
      Strings.createAccount: '''Створити аккаунт''',
      Strings.logIn: '''Вхід''',
      Strings.passwordCanOnlyContainNumbersL:
          '''Пароль може містити лише цифри, літери та @!#&*~\$-''',
      Strings.passwordMustContainAtLeast8Cha:
          '''Пароль має містити щонайменше 8 символів''',
      Strings.theFieldMustBeFilled: '''Поле має бути заповнене''',
      Strings.pleaseUseAValidEmail:
          '''Використовуйте дійсну електронну адресу''',
      Strings.passwordsDoNotMatch: '''Паролі не збігаються''',
      Strings.emailAlreadyInUse: '''Email вже використовується''',
      Strings.invalidCredential: '''Невірний email або пароль''',
    },
  };
}
