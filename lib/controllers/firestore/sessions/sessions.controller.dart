import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:get/get.dart';

class SessionsController extends GetxController {
  RxList<SessionModel> sessionsStream;
  // Rx<JoygiverProfileModel> joygiverProfileStream;
  // Rx<AdvocateProfileModel> advocateProfileStream;

  List<SessionModel> get sessions => sessionsStream.value;
  // JoygiverProfileModel get joygiverProfile => joygiverProfileStream.value;
  // AdvocateProfileModel get advocateProfile => advocateProfileStream.value;

  @override
  // ignore: must_call_super
  void onInit() async {
    // once(sessionsStream, handleSessionsChange);
    sessionsStream.bindStream(FirestoreController.to.mySessionsStream());
    // joygiverProfileStream
    //     .bindStream(AuthController.to.streamFirestoreJoygiver());
  }

  void handleSessionsChange(List<SessionModel> sessions) {
    // advocateProfileStream.bindStream(FirestoreController.to
    //     .advocateProfileStream(advocateId: sessionModel.advocateId));
  }
}
