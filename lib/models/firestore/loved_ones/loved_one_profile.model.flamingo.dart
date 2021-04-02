// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loved_one_profile.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum LovedOneProfileModelKey {
  name,
  profilePicUrl,
  phoneNumber,
  dob,
  advocateId,
}

extension LovedOneProfileModelKeyExtension on LovedOneProfileModelKey {
  String get value {
    switch (this) {
      case LovedOneProfileModelKey.name:
        return 'name';
      case LovedOneProfileModelKey.profilePicUrl:
        return 'profilePicUrl';
      case LovedOneProfileModelKey.phoneNumber:
        return 'phoneNumber';
      case LovedOneProfileModelKey.dob:
        return 'dob';
      case LovedOneProfileModelKey.advocateId:
        return 'advocateId';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(LovedOneProfileModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'dob', doc.dob);
  Helper.writeNotNull(data, 'advocateId', doc.advocateId);

  return data;
}

/// For load data
void _$fromData(LovedOneProfileModel doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<dynamic>(data, 'name');
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');
  doc.advocateId = Helper.valueFromKey<String>(data, 'advocateId');
}
