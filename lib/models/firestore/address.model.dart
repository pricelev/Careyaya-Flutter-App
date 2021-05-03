import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'address.model.flamingo.dart';

class AddressModel extends Model {
  AddressModel({
    this.description,
    this.state,
    this.longitude,
    this.latitude,
    this.city,
    this.line1,
    this.line2 = '',
    this.placeId,
    this.zip,
    Map<String, dynamic> values,
  }) : super(values: values);

  @Field()
  String description;
  @Field()
  String city;
  @Field()
  num latitude;
  @Field()
  num longitude;
  @Field()
  String line1;
  @Field()
  String line2;
  @Field()
  String placeId;
  @Field()
  String state;
  @Field()
  String country = 'US';
  @Field()
  String zip;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
