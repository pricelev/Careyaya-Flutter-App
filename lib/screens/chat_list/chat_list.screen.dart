import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:careyaya/screens/chat_list/local_controllers/chats.controller.dart';
import 'package:careyaya/screens/chat_list/local_widgets/chat_list_item.widget.dart';
import 'package:careyaya/screens/loading/loading.screen.dart';
import 'package:careyaya/widgets/layout/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      title: 'Messages',
      body: GetX<ChatsController>(
        init: Get.put<ChatsController>(ChatsController()),
        builder: (ChatsController chatsController) {
          if (chatsController != null &&
              !chatsController.isBlank &&
              chatsController.chats != null &&
              chatsController.chats != null) {
            if (chatsController.chats.isEmpty) {
              return const Center(
                child: Text('No chats found.'),
              );
            }
            chatsController.chats.sort((ChatModel a, ChatModel b) =>
                a.updatedAt.millisecondsSinceEpoch >
                            b.updatedAt.millisecondsSinceEpoch ==
                        false
                    ? 1
                    : 0);
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                            height: 0,
                            thickness: 0,
                            color: Colors.grey,
                          ),
                      itemCount: chatsController.chats.length,
                      itemBuilder: (_, index) {
                        final hasBorderBottom =
                            index == chatsController.chats.length - 1;
                        final boxDecoration = hasBorderBottom
                            ? const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.0,
                                  ),
                                ),
                                // borderRadius: BorderRadius.circular(5.0),
                              )
                            : null;
                        final chat = chatsController.chats[index];
                        return Container(
                          key: Key(chat.reference.id),
                          decoration: boxDecoration,
                          child: ChatListItem(chat: chat),
                        );
                      }),
                ),
              ],
            );
          } else {
            return LoadingScreen();
          }
        },
      ),
    );
  }
}
