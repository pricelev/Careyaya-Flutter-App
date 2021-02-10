class FirestorePath {
  static String user(String uid) => 'users/$uid';

  static String users() => 'users';

  static String chat(String chatId) => 'chats/$chatId';

  static String chats() => 'chats';
}