// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ChatMessageModelKey {
  text,
  senderId,
  id,
  createdAt,
}

extension ChatMessageModelKeyExtension on ChatMessageModelKey {
  String get value {
    switch (this) {
      case ChatMessageModelKey.text:
        return 'text';
      case ChatMessageModelKey.senderId:
        return 'senderId';
      case ChatMessageModelKey.id:
        return 'id';
      case ChatMessageModelKey.createdAt:
        return 'createdAt';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ChatMessageModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'text', doc.text);
  Helper.writeNotNull(data, 'senderId', doc.senderId);
  Helper.writeNotNull(data, 'id', doc.id);
  Helper.writeNotNull(data, 'createdAt', doc.createdAt);

  return data;
}

/// For load data
void _$fromData(ChatMessageModel doc, Map<String, dynamic> data) {
  doc.text = Helper.valueFromKey<String>(data, 'text');
  doc.senderId = Helper.valueFromKey<String>(data, 'senderId');
  doc.id = Helper.valueFromKey<String>(data, 'id');
  if (data['createdAt'] is Map) {
    doc.createdAt = Helper.timestampFromMap(data, 'createdAt');
  } else {
    doc.createdAt = Helper.valueFromKey<Timestamp>(data, 'createdAt');
  }
}
