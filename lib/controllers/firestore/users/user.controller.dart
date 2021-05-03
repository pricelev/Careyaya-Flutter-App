import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/firestore/users/user.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

// Right now this doesn't get live updates. Only gets data on initialization.

class UserController extends GetxController {
  final String uid;

  UserModel firestoreUser;

  UserModel get user => firestoreUser;

  UserController({@required this.uid});

  // @override
  // void onInit() async {
  //   super.onInit();
  // }

  @override
  Future<void> onReady() async {
    firestoreUser = await FirestoreController.to.getFirestoreUser(uid);
    update();
  }
}
