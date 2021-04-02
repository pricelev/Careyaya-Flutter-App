import 'package:careyaya/constants/firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'user.model.flamingo.dart';

class UserModel extends Document<UserModel> {
  UserModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef:
              Flamingo.instance.firestore.collection(USERS_COLLECTION),
        );

  @Field()
  dynamic name;
  @Field()
  String email;
  @Field()
  String profilePicUrl;
  @Field()
  String phoneNumber;
  @Field()
  String dob;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
