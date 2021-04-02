import 'package:careyaya/constants/firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'session_review_by_joygiver.model.flamingo.dart';

class SessionReviewByJoygiverModel
    extends Document<SessionReviewByJoygiverModel> {
  SessionReviewByJoygiverModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef: Flamingo.instance.firestore
              .collection(SESSION_REVIEWS_BY_JOYGIVERS_COLLECTION),
        );

  @Field()
  String advocateId;
  @Field()
  String joygiverId;
  @Field()
  bool changeInAssistance;
  @Field()
  bool verballyAggressive;
  @Field()
  bool physicallyAggressive;
  @Field()
  bool noncompliant;
  @Field()
  bool triedToLeave;
  @Field()
  bool emotionalDistress;
  @Field()
  bool difficultySwallowing;
  @Field()
  bool difficultyEating;
  @Field()
  bool fell;
  @Field()
  bool otherMedicalIssues;
  @Field()
  num cognitiveFunctioningRating;
  @Field()
  num physicalFunctioningRating;
  @Field()
  String moodRating;
  @Field()
  String overallExperienceRating;
  @Field()
  String description;
  @Field()
  String activitiesDescription;

  Stream<SessionReviewByJoygiverModel> get stream => reference.snapshots().map(
      (snap) => SessionReviewByJoygiverModel(id: snap.id, values: snap.data()));

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
