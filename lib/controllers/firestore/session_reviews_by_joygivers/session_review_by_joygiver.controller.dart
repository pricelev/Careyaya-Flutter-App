import 'package:careyaya/models/firestore/session_reviews_by_joygivers/session_review_by_joygiver.model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SessionReviewByJoygiverController extends GetxController {
  final String reviewId;
  Rx<SessionReviewByJoygiverModel> _sessionReviewStream;

  SessionReviewByJoygiverModel get sessionReview => _sessionReviewStream.value;

  SessionReviewByJoygiverController({@required this.reviewId});

  @override
  // ignore: must_call_super
  void onInit() async {
    _sessionReviewStream
        .bindStream(SessionReviewByJoygiverModel(id: this.reviewId).stream);
  }
}
