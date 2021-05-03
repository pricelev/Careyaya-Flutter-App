// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum UserModelKey {
  email,
  profilePicUrl,
  phoneNumber,
  dob,
  name,
}

extension UserModelKeyExtension on UserModelKey {
  String get value {
    switch (this) {
      case UserModelKey.email:
        return 'email';
      case UserModelKey.profilePicUrl:
        return 'profilePicUrl';
      case UserModelKey.phoneNumber:
        return 'phoneNumber';
      case UserModelKey.dob:
        return 'dob';
      case UserModelKey.name:
        return 'name';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(UserModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'dob', doc.dob);

  Helper.writeModelNotNull(data, 'name', doc.name);

  return data;
}

/// For load data
void _$fromData(UserModel doc, Map<String, dynamic> data) {
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');

  final _name = Helper.valueMapFromKey<String, dynamic>(data, 'name');
  if (_name != null) {
    doc.name = NameModel(values: _name);
  } else {
    doc.name = null;
  }
}
