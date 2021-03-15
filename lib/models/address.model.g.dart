// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    description: json['description'] as String,
    state: json['state'] as String,
    longitude: json['longitude'] as num,
    latitude: json['latitude'] as num,
    city: json['city'] as String,
    line1: json['line1'] as String,
    line2: json['line2'] as String,
    placeId: json['placeId'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'description': instance.description,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'line1': instance.line1,
      'line2': instance.line2,
      'placeId': instance.placeId,
      'state': instance.state,
      'zip': instance.zip,
    };
