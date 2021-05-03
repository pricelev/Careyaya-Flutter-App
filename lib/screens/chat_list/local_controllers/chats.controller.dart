import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  RxList<ChatModel> _chatList = RxList<ChatModel>();

  List<ChatModel> get chats => _chatList.toList();

  @override
  void onInit() async {
    final myChatsStream = FirestoreController.to.myChatsStream();
    _chatList.bindStream(myChatsStream); // stream chats from firestore
    super.onInit();
  }
}
