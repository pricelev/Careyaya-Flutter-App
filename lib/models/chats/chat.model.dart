import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/models/chats/chat_message.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// Represents a chat object between two users.
class ChatModel {
  final List<String> participantIds;
  final List<ChatMessageModel> messages;
  final Timestamp createdAt;
  final Timestamp lastUpdated;
  final DocumentReference reference;

  ChatModel(
      {@required this.participantIds,
      @required this.messages,
      @required this.lastUpdated,
      @required this.createdAt,
      @required this.reference});

  // Add the document ID to the post model when serialising.
  factory ChatModel.fromMap(
      Map<String, dynamic> data, DocumentReference reference) {
    assert(data['participantIds'] != null);
    assert(data['messages'] != null && data['messages'] is List<dynamic>);
    assert(data['createdAt'] != null);
    assert(data['lastUpdated'] != null);

    List<String> participantIds = [];
    List<dynamic>.from(data['participantIds']).forEach((participantId) {
      String id = participantId.toString();
      participantIds.add(id);
    });

    List<ChatMessageModel> messages = [];
    List<dynamic>.from(data['messages']).forEach((message) {
      ChatMessageModel chatMessage = ChatMessageModel.fromMap(message);
      messages.add(chatMessage);
    });

    return ChatModel(
      participantIds: participantIds,
      messages: messages,
      createdAt: data['createdAt'],
      lastUpdated: data['lastUpdated'],
      reference: reference,
    );
  }

  static getOtherUserId(ChatModel chat) => chat.participantIds.firstWhere(
      (participantId) => participantId != AuthController.to.user.uid);

  // ChatModel.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$participantIds:$createdAt>";
}
