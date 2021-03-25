import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/advocates/advocate_profile.model.dart';
import 'package:careyaya/models/joygivers/joygiver_profile.model.dart';
import 'package:careyaya/models/sessions/session.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SessionController extends GetxController {
  final String sessionId;
  Rx<SessionModel> sessionStream;
  Rx<JoygiverProfileModel> joygiverProfileStream;
  Rx<AdvocateProfileModel> advocateProfileStream;

  SessionModel get session => sessionStream.value;
  JoygiverProfileModel get joygiverProfile => joygiverProfileStream.value;
  AdvocateProfileModel get advocateProfile => advocateProfileStream.value;

  SessionController({@required this.sessionId});

  @override
  // ignore: must_call_super
  void onInit() async {
    once(sessionStream, handleSessionChange);
    sessionStream
        .bindStream(FirestoreController.to.sessionStream(sessionId: sessionId));
    joygiverProfileStream
        .bindStream(AuthController.to.streamFirestoreJoygiver());
  }

  void handleSessionChange(SessionModel sessionModel) {
    advocateProfileStream.bindStream(FirestoreController.to
        .advocateProfileStream(advocateId: sessionModel.advocateId));
  }
}
