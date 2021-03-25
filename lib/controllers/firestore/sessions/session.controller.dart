import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/advocates/advocate_profile.model.dart';
import 'package:careyaya/models/joygivers/joygiver_profile.model.dart';
import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/models/user.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

// Right now this doesn't get live updates. Only gets data on initialization.
// Need to change this to get self JG Profile

class SessionController extends GetxController {
  final String sessionId;
  SessionModel sessionModel;
  Rx<JoygiverProfileModel> joygiverProfile;
  Rx<AdvocateProfileModel> advocateProfile;
  Rx<SessionModel> firestoreSession;

  SessionModel get session => firestoreSession.value;

  SessionController({@required this.sessionId});

  @override
  // ignore: must_call_super
  void onInit() async {
    sessionModel = SessionModel(id: sessionId);
    final Stream<SessionModel> sessionStream = sessionModel.reference
        .snapshots()
        .map((snap) => SessionModel(id: snap.id, values: snap.data()));
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
