import 'package:careyaya/constants/firestore.dart';
import 'package:careyaya/models/address.model.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'joygiver_application.model.flamingo.dart';

class JoygiverApplicationModel extends Document<JoygiverApplicationModel> {
  JoygiverApplicationModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef: Flamingo.instance.firestore
              .collection(JOYGIVER_APPLICATIONS_COLLECTION),
        );

  @Field()
  dynamic name;
  @Field()
  String email;
  @Field()
  String phoneNumber;
  @ModelField()
  AddressModel address;
  @Field()
  String profilePicUrl;
  @Field()
  String dob;
  @Field()
  bool visible;
  @Field()
  bool private;
  @Field()
  bool bookable;
  @Field()
  bool verified;
  @Field()
  Timestamp verifiedAt;
  @Field()
  dynamic coordinates;
  @Field()
  String stripeAccountId;
  @Field()
  dynamic joygiverPreferences;
  @Field()
  num reviewByAdvocateCount;
  @Field()
  num reviewByAdvocateStarCount;
  @Field()
  num reviewByFriendCount;
  @Field()
  num reviewByFriendStarCount;
  @Field()
  num rating;
  @Field()
  num requestedSessionCount;
  @Field()
  num acceptedSessionCount;
  @Field()
  num rejectedSessionCount;
  @Field()
  num completedSessionCount;
  @Field()
  num canceledSessionCount;
  @Field()
  num disputedSessionCount;
  @Field()
  num totalSessionResponseMinutes;
  @Field()
  List<String> advocateIds;
  @Field()
  bool approved;
  @Field()
  Timestamp approvedAt;
  @Field()
  String introVideoUrl;
  @Field()
  String coverVideoUrl;
  @Field()
  List<dynamic> profileImages;
  @Field()
  String introDescription;
  @Field()
  num yearsExperience;
  @Field()
  bool hasTransportation;
  @Field()
  String sex;
  @Field()
  bool isSmoker;
  @Field()
  bool drives;
  @Field()
  bool isComfortableWithPets;
  @Field()
  List<String> certificationsList;
  @Field()
  List<String> certificationUrls;
  @Field()
  num hourlyRate;
  @Field()
  List<dynamic> languages;
  @Field()
  List<String> hobbies;
  @Field()
  List<String> tasks;
  @Field()
  List<String> skills;
  @Field()
  List<String> covidHandlingMethods;
  @Field()
  List<int> baseWeekAvailableSlots;
  @Field()
  bool schedulingFlexibility;
  @Field()
  List<dynamic> interviewQuestions;
  @Field()
  List<dynamic> thirdPartyQuotes;
  @Field()
  String experienceDescription;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}

// coordinates: any; // This is a Firestore GeoPoint
// preferences: JoygiverPreferences;
// mbtiClassification?: {
// personalityType: string;
// probability: number;
// }
// interviewQuestions: Joygivers.JoygiverInterviewQuestion[];
// thirdPartyQuotes: Joygivers.JoygiverThirdPartyQuote[];
