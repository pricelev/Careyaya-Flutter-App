import 'package:careyaya/controllers/firestore/chats/chat.controller.dart';
import 'package:careyaya/ui/screens/loading.screen.dart';
import 'package:careyaya/ui/widgets/chats/chat_avatar_builder.dart';
import 'package:careyaya/ui/widgets/secondary_screen_layout.widget.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String chatId = Get.arguments['chatId'] as String;
    return GetX<ChatController>(
      init: Get.put<ChatController>(ChatController(chatId: chatId)),
      builder: (ChatController chatController) {
        if (chatController != null &&
            chatController.chat != null &&
            chatController.chat.messages != null &&
            chatController.otherUserProfile.value != null &&
            chatController.myUserProfile != null) {
          final myChatProfile = ChatUser(
              uid: chatController.myUserProfile?.uid,
              firstName: chatController.myUserProfile.name['first'],
              lastName: chatController.myUserProfile.name['last'],
              avatar: chatController.myUserProfile.profilePicUrl);
          final otherChatProfileName =
              '${chatController.otherUserProfile.value.name['first']} ${chatController.otherUserProfile.value.name['last']}';
          final otherChatProfile = ChatUser(
              uid: chatController.otherUserProfile.value.uid,
              name: otherChatProfileName,
              avatar: chatController.otherUserProfile.value.profilePicUrl);
          final List<ChatMessage> dashChatMessages =
              chatController.chat.messages.map((message) {
            final chatProfile = myChatProfile?.uid == message.senderId
                ? myChatProfile
                : otherChatProfile;
            return ChatMessage(
                text: message.text,
                user: chatProfile,
                id: message.id,
                createdAt: message.createdAt.toDate());
          }).toList();
          final scrollController = ScrollController(keepScrollOffset: true);
          return SecondaryScreenLayout(
            title: 'Message $otherChatProfileName',
            body: DashChat(
              scrollController: scrollController,
              avatarBuilder: chatAvatarBuilder,
              messages: dashChatMessages,
              user: myChatProfile,
              onSend: (ChatMessage message) {
                chatController.sendMessage(message.text);
              },
              dateFormat: DateFormat('MMM dd yyyy'),
              timeFormat: DateFormat('hh:mm aa'),
              inputMaxLines: 5,
              scrollToBottom: true,
              sendOnEnter: false,
              inputTextStyle: TextStyle(
                color: Colors.black,
              ),
              inputDecoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "Type your message here...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              showAvatarForEveryMessage: false,
              messageContainerPadding: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              inputContainerStyle: BoxDecoration(
                border: Border.all(width: 0.0),
                color: Colors.white,
              ),
              inputToolbarPadding: EdgeInsets.only(
                bottom: 40.0,
                left: 10.0,
                right: 10.0,
              ),
              scrollToBottomStyle: ScrollToBottomStyle(
                bottom: 110,
              ),
            ),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
