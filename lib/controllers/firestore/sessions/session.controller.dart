import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/models/user.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

// Right now this doesn't get live updates. Only gets data on initialization.
// Need to change this to get self JG Profile

class SessionController extends GetxController {
  final String sessionId;
  UserModel myUserProfile;
  Rx<UserModel> advocateProfile = Rx<UserModel>();

  Rx<SessionModel> firestoreSession = Rx<SessionModel>();

  SessionModel get session => firestoreSession.value;

  SessionController({@required this.sessionId});

  @override
  // ignore: must_call_super
  void onInit() async {
    final sessionStream =
        FirestoreController.to.sessionStream(sessionId: this.sessionId);
    // ever(firestoreSession, getOtherUserProfile);
    once(firestoreSession, getAdvocateProfile);
    firestoreSession.bindStream(sessionStream);
    myUserProfile = AuthController.to.getProfile;
  }

  // @override
  // void onReady() async {
  //   super.onReady();
  // }

  void getAdvocateProfile(SessionModel sessionModel) async {
    final advocateId = sessionModel.advocateId;
    final otherUser =
        await FirestoreController.to.getAdvocateProfile(advocateId);
    advocateProfile.value = otherUser;
  }
}
