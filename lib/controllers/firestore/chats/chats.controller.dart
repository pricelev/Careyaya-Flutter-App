import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/chats/chat.model.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  Rx<List<ChatModel>> chatList = Rx<List<ChatModel>>();

  List<ChatModel> get chats => chatList.value;

  @override
  void onInit() async {
    final myChatsStream = await FirestoreController.to.myChatsStream();
    chatList.bindStream(myChatsStream); // stream chats from firestore
    super.onInit();
  }
}
