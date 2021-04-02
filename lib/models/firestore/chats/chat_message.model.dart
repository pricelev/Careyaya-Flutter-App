import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

// Represents a chat message contained within a chat document's messages list.

part 'chat_message.model.flamingo.dart';

class ChatMessageModel extends Model {
  ChatMessageModel({
    this.text,
    this.senderId,
    this.createdAt,
    this.id,
    Map<String, dynamic> values,
  }) : super(values: values);

  @Field()
  String text;
  @Field()
  String senderId;
  @Field()
  String id;
  @Field()
  Timestamp createdAt;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
