import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

// Represents a chat message contained within a chat document.
class ChatMessageModel {
  final String text;
  final String senderId;
  final String id;
  final Timestamp createdAt;


  const ChatMessageModel(
      {@required this.text,
      @required this.senderId,
      @required this.createdAt,
      @required this.id});

  factory ChatMessageModel.fromMap(Map<String, dynamic> data) {
    assert(data['text'] != null);
    assert(data['senderId'] != null);
    assert(data['createdAt'] != null);
    assert(data['id'] != null);
    return ChatMessageModel(
      text: data['text'],
      senderId: data['senderId'],
      createdAt: data['createdAt'],
      id: data['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderId': senderId,
      'createdAt': createdAt,
      'id': id,
    };
  }
}
