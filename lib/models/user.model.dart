// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class UserModel {
  String uid;
  Map<String, dynamic> name;
  String email;
  String profilePicUrl;
  String phoneNNumber;
  String dob;

  UserModel(
      {@required this.uid,
      @required this.email,
      this.name,
      this.profilePicUrl,
      this.phoneNNumber,
      this.dob});

  factory UserModel.fromMap(Map data, String uid) {
    return UserModel(
      uid: uid,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      profilePicUrl: data['profilePicUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "profilePicUrl": profilePicUrl
      };

  // UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
  //   uid = documentSnapshot.id;
  //   name = documentSnapshot["name"];
  //   email = documentSnapshot["email"];
  // }
}
