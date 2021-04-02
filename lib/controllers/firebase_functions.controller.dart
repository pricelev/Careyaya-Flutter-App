import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';

class FirebaseFunctionsController extends GetxController {
  static FirebaseFunctionsController to = Get.find();

  FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<void> sendPasswordlessSignInLink(String email) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('sendPasswordlessSignInLink');
    return await callable({
      'email': email,
      'url': 'https://accounts-dev.careyaya.com',
    });
  }

  Future<void> acceptSession(String sessionId) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('acceptSession');
    return await callable(sessionId);
  }

  Future<void> rejectSession(String sessionId) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('rejectSession');
    return await callable(sessionId);
  }

  Future<void> cancelSession(String sessionId) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('cancelSession');
    return await callable(sessionId);
  }
}
