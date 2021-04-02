import 'package:careyaya/controllers/firestore/chats/chats.controller.dart';
import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:careyaya/ui/screens/loading.screen.dart';
import 'package:careyaya/ui/widgets/chats/chat_list_item.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
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
              return Center(
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
                      separatorBuilder: (context, index) => Divider(
                            height: 0,
                            thickness: 0,
                            color: Colors.grey,
                          ),
                      itemCount: chatsController.chats.length,
                      itemBuilder: (_, index) {
                        final hasBorderBottom =
                            index == chatsController.chats.length - 1;
                        final boxDecoration = hasBorderBottom
                            ? BoxDecoration(
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
                          child: ChatListItem(chat: chat),
                          decoration: boxDecoration,
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
