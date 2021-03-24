import 'package:careyaya/models/address.model.dart';
import 'package:careyaya/utils/firestore_timestamp_serialize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.model.g.dart';

@JsonSerializable()
class SessionModel {
  final String joygiverId;
  final String advocateId;
  final String lovedOneId;
  final AddressModel address;
  final num distance;
  final List<num> timeSlots;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp startTimestamp;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp endTimestamp;
  final num hourlyRate;
  final num hoursCount;
  final num totalCost;
  // Markers
  final String createdBy;
  final bool accepted;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp acceptedAt;
  final bool rejected;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp rejectedAt;
  final bool completed;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp completedAt;
  final bool canceled;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp canceledAt;
  final String canceledBy;
  final bool reviewedByAdvocate;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp reviewedByAdvocateAt;
  final bool reviewedByJoygiver;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp reviewedByJoygiverAt;
  final bool disputed;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp disputedAt;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  final Timestamp expiresAt;
  final bool expired;
  // Stripe Data
  final String stripeCustomerId;
  final bool stripePaymentIntentHoldCaptured;
  final String stripeAccountId;
  final String stripePaymentIntentId;
  final String stripePaymentMethodId;
  final String stripeTransferId;
  // Duplicated Data (Not currently in use)
  // final Map<String, dynamic> joygiverData;
  // final Map<String, dynamic> advocateData;
  // final Map<String, dynamic> lovedOneData;

  SessionModel(
      {this.joygiverId,
      this.advocateId,
      this.lovedOneId,
      this.address,
      this.distance,
      this.timeSlots,
      this.startTimestamp,
      this.endTimestamp,
      this.hourlyRate,
      this.hoursCount,
      this.totalCost,
      this.createdBy,
      this.accepted,
      this.acceptedAt,
      this.rejected,
      this.rejectedAt,
      this.completed,
      this.completedAt,
      this.canceled,
      this.canceledAt,
      this.canceledBy,
      this.reviewedByAdvocate,
      this.reviewedByAdvocateAt,
      this.reviewedByJoygiver,
      this.reviewedByJoygiverAt,
      this.disputed,
      this.disputedAt,
      this.expiresAt,
      this.expired,
      this.stripeCustomerId,
      this.stripePaymentIntentHoldCaptured,
      this.stripeAccountId,
      this.stripePaymentIntentId,
      this.stripePaymentMethodId,
      this.stripeTransferId});

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
