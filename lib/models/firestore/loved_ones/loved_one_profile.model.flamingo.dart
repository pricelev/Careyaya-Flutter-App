// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loved_one_profile.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum LovedOneProfileModelKey {
  profilePicUrl,
  phoneNumber,
  dob,
  advocateId,
  name,
}

extension LovedOneProfileModelKeyExtension on LovedOneProfileModelKey {
  String get value {
    switch (this) {
      case LovedOneProfileModelKey.profilePicUrl:
        return 'profilePicUrl';
      case LovedOneProfileModelKey.phoneNumber:
        return 'phoneNumber';
      case LovedOneProfileModelKey.dob:
        return 'dob';
      case LovedOneProfileModelKey.advocateId:
        return 'advocateId';
      case LovedOneProfileModelKey.name:
        return 'name';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(LovedOneProfileModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'dob', doc.dob);
  Helper.writeNotNull(data, 'advocateId', doc.advocateId);

  Helper.writeModelNotNull(data, 'name', doc.name);

  return data;
}

/// For load data
void _$fromData(LovedOneProfileModel doc, Map<String, dynamic> data) {
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');
  doc.advocateId = Helper.valueFromKey<String>(data, 'advocateId');

  final _name = Helper.valueMapFromKey<String, dynamic>(data, 'name');
  if (_name != null) {
    doc.name = NameModel(values: _name);
  } else {
    doc.name = null;
  }
}
