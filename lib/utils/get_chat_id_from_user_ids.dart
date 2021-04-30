import 'dart:convert';

import 'package:crypto/crypto.dart';

String getChatIdFromUserIds(List<String> userIds) {
  userIds.sort();
  final joinedUserIds = userIds.join();
  final bytes = utf8.encode(joinedUserIds);
  final hashedChatId = sha256.convert(bytes);
  return hashedChatId.toString();
}
