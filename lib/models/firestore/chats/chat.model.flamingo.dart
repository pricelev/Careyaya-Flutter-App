// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ChatModelKey {
  participantIds,
  createdAt,
  updatedAt,
  messages,
}

extension ChatModelKeyExtension on ChatModelKey {
  String get value {
    switch (this) {
      case ChatModelKey.participantIds:
        return 'participantIds';
      case ChatModelKey.createdAt:
        return 'createdAt';
      case ChatModelKey.updatedAt:
        return 'updatedAt';
      case ChatModelKey.messages:
        return 'messages';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(ChatModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'participantIds', doc.participantIds);
  Helper.writeNotNull(data, 'createdAt', doc.createdAt);
  Helper.writeNotNull(data, 'updatedAt', doc.updatedAt);

  Helper.writeModelListNotNull(data, 'messages', doc.messages);

  return data;
}

/// For load data
void _$fromData(ChatModel doc, Map<String, dynamic> data) {
  doc.participantIds = Helper.valueListFromKey<String>(data, 'participantIds');
  if (data['createdAt'] is Map) {
    doc.createdAt = Helper.timestampFromMap(data, 'createdAt');
  } else {
    doc.createdAt = Helper.valueFromKey<Timestamp>(data, 'createdAt');
  }

  if (data['updatedAt'] is Map) {
    doc.updatedAt = Helper.timestampFromMap(data, 'updatedAt');
  } else {
    doc.updatedAt = Helper.valueFromKey<Timestamp>(data, 'updatedAt');
  }

  final _messages =
      Helper.valueMapListFromKey<String, dynamic>(data, 'messages');
  if (_messages != null) {
    doc.messages = _messages
        .where((d) => d != null)
        .map((d) => ChatMessageModel(values: d))
        .toList();
  } else {
    doc.messages = null;
  }
}
