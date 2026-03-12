import 'package:fymoney/app/translations/messages/messages_en.dart';
import 'package:fymoney/app/translations/messages/messages_uk.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Messages extends Translations {
  final MessagesEn _messagesEn = MessagesEn();
  final MessagesUk _messagesUk = MessagesUk();

  @override
  Map<String, Map<String, String>> get keys {
    Map<String, Map<String, String>> combinedKeys = {
      ..._messagesEn.keys,
      ..._messagesUk.keys,
    };
    return combinedKeys;
  }
}
