import 'package:careyaya/models/firestore/address.model.dart';
import 'package:flamingo/flamingo.dart';
import 'package:careyaya/models/firestore/name.model.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'advocate_profile.model.flamingo.dart';

class AdvocateProfileModel extends Document<AdvocateProfileModel> {
  AdvocateProfileModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @ModelField()
  NameModel name;
  @Field()
  String email;
  @Field()
  String phoneNumber;
  @ModelField()
  AddressModel address;
  @Field()
  String profilePicUrl;
  @Field()
  String dob;
  @Field()
  List<String> joygiverIds;
  @Field()
  List<String> favoriteJoygiverIds;
  @Field()
  num totalSessionCount;
  @Field()
  num canceledSessionCount;

  Stream<AdvocateProfileModel> get stream => reference
      .snapshots()
      .map((snap) => AdvocateProfileModel(id: snap.id, values: snap.data()));

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
