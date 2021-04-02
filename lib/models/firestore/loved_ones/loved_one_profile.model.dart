import 'package:careyaya/constants/firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'loved_one_profile.model.flamingo.dart';

class LovedOneProfileModel extends Document<LovedOneProfileModel> {
  LovedOneProfileModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef:
              Flamingo.instance.firestore.collection(LOVED_ONES_COLLECTION),
        );

  @Field()
  dynamic name;
  @Field()
  String profilePicUrl;
  @Field()
  String phoneNumber;
  @Field()
  String dob;
  @Field()
  String advocateId;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
