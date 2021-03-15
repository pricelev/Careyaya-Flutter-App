import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'address.model.g.dart';

@JsonSerializable()
class Address {
  final String description;
  final String city;
  final num latitude;
  final num longitude;
  final String line1;
  final String line2;
  final String placeId;
  final String state;
  final String country = 'US';
  final String zip;

  Address({
    @required this.description,
    @required this.state,
    @required this.longitude,
    @required this.latitude,
    @required this.city,
    @required this.line1,
    this.line2,
    @required this.placeId,
    @required this.zip,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
