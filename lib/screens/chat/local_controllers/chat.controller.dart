import 'package:careyaya/controllers/auth/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:careyaya/models/firestore/chats/chat_message.model.dart';
import 'package:careyaya/models/firestore/users/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

// Right now this doesn't get live updates. Only gets data on initialization.

class ChatController extends GetxController {
  final String chatId;
  UserModel myUserProfile;
  Rx<UserModel> otherUserProfile = Rx<UserModel>();

  Rx<ChatModel> firestoreChat = Rx<ChatModel>();

  ChatModel get chat => firestoreChat.value;

  ChatController({@required this.chatId});

  @override
  // ignore: must_call_super
  Future<void> onInit() async {
    final chatStream = FirestoreController.to.chatStream(chatId: chatId);
    ever(firestoreChat, getOtherUserProfile);
    firestoreChat.bindStream(chatStream);
    myUserProfile = AuthController.to.getProfile;
  }

  // @override
  // void onReady() async {
  //   super.onReady();
  // }

  Future<void> getOtherUserProfile(ChatModel chatModel) async {
    final otherUserId = ChatModel.getOtherUserId(chatModel);
    final otherUser =
        await FirestoreController.to.getFirestoreUser(otherUserId);
    otherUserProfile.value = otherUser;
  }

  Future<void> sendMessage(String messageText) async {
    final messageId = uuid.v4();
    final currentTimestamp = Timestamp.now();
    final ChatMessageModel message = ChatMessageModel(
        text: messageText,
        senderId: myUserProfile.id,
        createdAt: currentTimestamp,
        id: messageId);
    await FirestoreController.to.sendChatMessage(chatId, message);
  }
}
