// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class UserModel {
  String uid;
  Map<String, dynamic> name;
  String email;
  String profilePicUrl;

  UserModel({@required this.uid, this.name, this.email, this.profilePicUrl});

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
