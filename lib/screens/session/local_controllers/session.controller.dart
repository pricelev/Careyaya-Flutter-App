import 'package:careyaya/controllers/auth/auth.controller.dart';
import 'package:careyaya/controllers/firestore/firestore.controller.dart';
import 'package:careyaya/models/firestore/advocates/advocate_profile.model.dart';
import 'package:careyaya/models/firestore/joygivers/joygiver_profile.model.dart';
import 'package:careyaya/models/firestore/loved_ones/loved_one_profile.model.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SessionController extends GetxController {
  final String sessionId;
  Rx<SessionModel> _sessionStream = Rx<SessionModel>();
  Rx<JoygiverProfileModel> _joygiverProfileStream = Rx<JoygiverProfileModel>();
  Rx<AdvocateProfileModel> _advocateProfileStream = Rx<AdvocateProfileModel>();
  Rx<LovedOneProfileModel> _lovedOneProfileStream = Rx<LovedOneProfileModel>();

  SessionModel get session => _sessionStream.value;
  JoygiverProfileModel get joygiverProfile => _joygiverProfileStream.value;
  AdvocateProfileModel get advocateProfile => _advocateProfileStream.value;
  LovedOneProfileModel get lovedOneProfile => _lovedOneProfileStream.value;

  SessionController({@required this.sessionId});

  @override
  // ignore: must_call_super
  void onInit() async {
    once(_sessionStream, _handleSessionChange);
    _sessionStream
        .bindStream(FirestoreController.to.sessionStream(sessionId: sessionId));
    _joygiverProfileStream
        .bindStream(AuthController.to.streamFirestoreJoygiver());
  }

  void _handleSessionChange(SessionModel sessionModel) {
    _advocateProfileStream.bindStream(FirestoreController.to
        .advocateProfileStream(advocateId: sessionModel.advocateId));
    _lovedOneProfileStream.bindStream(FirestoreController.to
        .lovedOneProfileStream(lovedOneId: sessionModel.lovedOneId));
  }
}
