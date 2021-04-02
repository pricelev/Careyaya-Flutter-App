import 'package:careyaya/constants/routes.dart';
import 'package:careyaya/controllers/firestore/user.controller.dart';
import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:careyaya/ui/widgets/chats/chat_list_item_skeleton.widget.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListItem extends StatelessWidget {
  final ChatModel chat;

  ChatListItem({@required this.chat});

  @override
  Widget build(BuildContext context) {
    final String dateString =
        DateFormat('hh:mm aa MM/dd/yyyy').format(this.chat.updatedAt.toDate());

    final otherUserId = ChatModel.getOtherUserId(this.chat);

    void _onTap() {
      Get.toNamed(
        CHAT_ROUTE,
        arguments: {
          'chatId': this.chat.reference.id,
        },
      );
    }

    return GetBuilder<UserController>(
      tag: otherUserId,
      init: Get.put<UserController>(UserController(uid: otherUserId),
          tag: otherUserId),
      builder: (UserController userController) {
        if (userController != null &&
            userController.user != null &&
            userController.user.id != null) {
          final title =
              '${userController.user.name['first']} ${userController.user.name['last']}';
          final avatar = userController.user.profilePicUrl.length == 0
              ? CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                )
              : CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(userController.user.profilePicUrl),
                );
          return GestureDetector(
            onTap: _onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
              width: 1,
              child: ListTile(
                leading: avatar,
                title: Text(title),
                subtitle: Text(dateString),
              ),
            ),
          );
        } else {
          return ChatListItemSkeleton();
        }
      },
    );
  }
}
