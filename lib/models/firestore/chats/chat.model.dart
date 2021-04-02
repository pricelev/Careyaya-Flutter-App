import 'package:careyaya/constants/firestore.dart';
import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/models/firestore/chats/chat_message.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

// Represents a chat object between two users.

part 'chat.model.flamingo.dart';

class ChatModel extends Document<ChatModel> {
  ChatModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef:
              Flamingo.instance.firestore.collection(CHATS_COLLECTION),
        );

  @Field()
  List<String> participantIds;
  @ModelField()
  List<ChatMessageModel> messages;
  @Field()
  Timestamp createdAt;
  @Field()
  Timestamp updatedAt;

  static getOtherUserId(ChatModel chat) => chat.participantIds.firstWhere(
      (participantId) => participantId != AuthController.to.user.uid);

  @override
  String toString() => "Record<$participantIds:$createdAt>";

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
