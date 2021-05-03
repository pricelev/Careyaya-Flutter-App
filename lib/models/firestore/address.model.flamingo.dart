// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum AddressModelKey {
  description,
  city,
  latitude,
  longitude,
  line1,
  line2,
  placeId,
  state,
  country,
  zip,
}

extension AddressModelKeyExtension on AddressModelKey {
  String get value {
    switch (this) {
      case AddressModelKey.description:
        return 'description';
      case AddressModelKey.city:
        return 'city';
      case AddressModelKey.latitude:
        return 'latitude';
      case AddressModelKey.longitude:
        return 'longitude';
      case AddressModelKey.line1:
        return 'line1';
      case AddressModelKey.line2:
        return 'line2';
      case AddressModelKey.placeId:
        return 'placeId';
      case AddressModelKey.state:
        return 'state';
      case AddressModelKey.country:
        return 'country';
      case AddressModelKey.zip:
        return 'zip';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(AddressModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'city', doc.city);
  Helper.writeNotNull(data, 'latitude', doc.latitude);
  Helper.writeNotNull(data, 'longitude', doc.longitude);
  Helper.writeNotNull(data, 'line1', doc.line1);
  Helper.writeNotNull(data, 'line2', doc.line2);
  Helper.writeNotNull(data, 'placeId', doc.placeId);
  Helper.writeNotNull(data, 'state', doc.state);
  Helper.writeNotNull(data, 'country', doc.country);
  Helper.writeNotNull(data, 'zip', doc.zip);

  return data;
}

/// For load data
void _$fromData(AddressModel doc, Map<String, dynamic> data) {
  doc.description = Helper.valueFromKey<String>(data, 'description');
  doc.city = Helper.valueFromKey<String>(data, 'city');
  doc.latitude = Helper.valueFromKey<num>(data, 'latitude');
  doc.longitude = Helper.valueFromKey<num>(data, 'longitude');
  doc.line1 = Helper.valueFromKey<String>(data, 'line1');
  doc.line2 = Helper.valueFromKey<String>(data, 'line2');
  doc.placeId = Helper.valueFromKey<String>(data, 'placeId');
  doc.state = Helper.valueFromKey<String>(data, 'state');
  doc.country = Helper.valueFromKey<String>(data, 'country');
  doc.zip = Helper.valueFromKey<String>(data, 'zip');
}
