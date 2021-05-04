import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

Widget chatAvatarBuilder(ChatUser user) {
  final constraints = BoxConstraints(
      maxHeight: MediaQuery.of(Get.context).size.height,
      maxWidth: MediaQuery.of(Get.context).size.width);
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      ClipOval(
        child: Container(
          height: constraints.maxWidth * 0.08,
          width: constraints.maxWidth * 0.08,
          constraints: const BoxConstraints(
              // maxWidth: avatarMaxSize,
              // maxHeight: avatarMaxSize,
              ),
          color: Colors.grey,
          child: Center(
              child: Text(
                  user.name == null || user.name.isEmpty ? '' : user.name[0])),
        ),
      ),
      if (user.avatar != null && user.avatar.isNotEmpty)
        Center(
          child: ClipOval(
            child: FadeInImage.memoryNetwork(
              image: user.avatar,
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              height: constraints.maxWidth * 0.08,
              width: constraints.maxWidth * 0.08,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
          ),
        )
      else
        const Center(
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        )
    ],
  );
}
