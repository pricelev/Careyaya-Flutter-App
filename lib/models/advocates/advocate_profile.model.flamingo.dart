// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advocate_profile.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum AdvocateProfileModelKey {
  name,
  email,
  phoneNumber,
  profilePicUrl,
  dob,
  joygiverIds,
  favoriteJoygiverIds,
  totalSessionCount,
  canceledSessionCount,
  address,
}

extension AdvocateProfileModelKeyExtension on AdvocateProfileModelKey {
  String get value {
    switch (this) {
      case AdvocateProfileModelKey.name:
        return 'name';
      case AdvocateProfileModelKey.email:
        return 'email';
      case AdvocateProfileModelKey.phoneNumber:
        return 'phoneNumber';
      case AdvocateProfileModelKey.profilePicUrl:
        return 'profilePicUrl';
      case AdvocateProfileModelKey.dob:
        return 'dob';
      case AdvocateProfileModelKey.joygiverIds:
        return 'joygiverIds';
      case AdvocateProfileModelKey.favoriteJoygiverIds:
        return 'favoriteJoygiverIds';
      case AdvocateProfileModelKey.totalSessionCount:
        return 'totalSessionCount';
      case AdvocateProfileModelKey.canceledSessionCount:
        return 'canceledSessionCount';
      case AdvocateProfileModelKey.address:
        return 'address';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(AdvocateProfileModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'dob', doc.dob);
  Helper.writeNotNull(data, 'joygiverIds', doc.joygiverIds);
  Helper.writeNotNull(data, 'favoriteJoygiverIds', doc.favoriteJoygiverIds);
  Helper.writeNotNull(data, 'totalSessionCount', doc.totalSessionCount);
  Helper.writeNotNull(data, 'canceledSessionCount', doc.canceledSessionCount);

  Helper.writeModelNotNull(data, 'address', doc.address);

  return data;
}

/// For load data
void _$fromData(AdvocateProfileModel doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<dynamic>(data, 'name');
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');
  doc.joygiverIds = Helper.valueListFromKey<String>(data, 'joygiverIds');
  doc.favoriteJoygiverIds =
      Helper.valueListFromKey<String>(data, 'favoriteJoygiverIds');
  doc.totalSessionCount = Helper.valueFromKey<num>(data, 'totalSessionCount');
  doc.canceledSessionCount =
      Helper.valueFromKey<num>(data, 'canceledSessionCount');

  final _address = Helper.valueMapFromKey<String, dynamic>(data, 'address');
  if (_address != null) {
    doc.address = AddressModel(values: _address);
  } else {
    doc.address = null;
  }
}
