import 'package:fymoney/localization/messages/messages_en.dart';
import 'package:fymoney/localization/messages/messages_ua.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Messages extends Translations {
  final MessagesEn _messagesEn = MessagesEn();
  final MessagesUa _messagesEs = MessagesUa();

  @override
  Map<String, Map<String, String>> get keys {
    Map<String, Map<String, String>> combinedKeys = {
      ..._messagesEn.keys,
      ..._messagesEs.keys,
    };
    return combinedKeys;
  }
}
