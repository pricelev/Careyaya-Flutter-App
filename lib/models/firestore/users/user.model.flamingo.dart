// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserModelKey {
  name,
  email,
  profilePicUrl,
  phoneNumber,
  dob,
}

extension UserModelKeyExtension on UserModelKey {
  String get value {
    switch (this) {
      case UserModelKey.name:
        return 'name';
      case UserModelKey.email:
        return 'email';
      case UserModelKey.profilePicUrl:
        return 'profilePicUrl';
      case UserModelKey.phoneNumber:
        return 'phoneNumber';
      case UserModelKey.dob:
        return 'dob';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(UserModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'dob', doc.dob);

  return data;
}

/// For load data
void _$fromData(UserModel doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<dynamic>(data, 'name');
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');
}
