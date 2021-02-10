import 'package:careyaya/controllers/firestore/chats/chats.controller.dart';
import 'package:careyaya/models/chats/chat.model.dart';
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
        init: Get.put(ChatsController()),
        builder: (ChatsController chatsController) {
          if (chatsController != null &&
              chatsController.chatList != null &&
              chatsController.chatList.value != null) {
            if (chatsController.chatList.value.isEmpty) {
              return Center(
                child: Text('No chats found.'),
              );
            }
            chatsController.chatList.value.sort((ChatModel a, ChatModel b) =>
                a.lastUpdated.millisecondsSinceEpoch >
                            b.lastUpdated.millisecondsSinceEpoch ==
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
                      itemCount: chatsController.chatList.value.length,
                      itemBuilder: (_, index) {
                        final hasBorderBottom =
                            index == chatsController.chatList.value.length - 1;
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
                        final chat = chatsController.chatList.value[index];
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
