import 'package:careyaya/constants/firestore.dart';
import 'package:careyaya/models/firestore/address.model.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'session.model.flamingo.dart';

class SessionModel extends Document<SessionModel> {
  SessionModel({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef:
              Flamingo.instance.firestore.collection(SESSIONS_COLLECTION),
        );

  @Field()
  String joygiverId;
  @Field()
  String advocateId;
  @Field()
  String lovedOneId;
  @ModelField()
  AddressModel address;
  @Field()
  num distance;
  @Field()
  List<num> timeSlots;
  @Field()
  Timestamp startTimestamp;
  @Field()
  Timestamp endTimestamp;
  @Field()
  num hourlyRate;
  @Field()
  num hoursCount;
  @Field()
  num totalCost;
  // Markers
  @Field()
  String createdBy;
  @Field()
  bool accepted;
  @Field()
  Timestamp acceptedAt;
  @Field()
  bool rejected;
  @Field()
  Timestamp rejectedAt;
  @Field()
  bool completed;
  @Field()
  Timestamp completedAt;
  @Field()
  bool canceled;
  @Field()
  Timestamp canceledAt;
  @Field()
  String canceledBy;
  @Field()
  bool reviewedByAdvocate;
  @Field()
  Timestamp reviewedByAdvocateAt;
  @Field()
  bool reviewedByJoygiver;
  @Field()
  Timestamp reviewedByJoygiverAt;
  @Field()
  bool disputed;
  @Field()
  Timestamp disputedAt;
  @Field()
  Timestamp expiresAt;
  @Field()
  bool expired;
  // Stripe Data
  @Field()
  String stripeCustomerId;
  @Field()
  bool stripePaymentIntentHoldCaptured;
  @Field()
  String stripeAccountId;
  @Field()
  String stripePaymentIntentId;
  @Field()
  String stripePaymentMethodId;
  @Field()
  String stripeTransferId;
  // Duplicated Data (Not currently in use)
  // Map<String, dynamic> joygiverData;
  // Map<String, dynamic> advocateData;
  // Map<String, dynamic> lovedOneData;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
