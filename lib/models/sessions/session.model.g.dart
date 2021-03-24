// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return SessionModel(
    joygiverId: json['joygiverId'] as String,
    advocateId: json['advocateId'] as String,
    lovedOneId: json['lovedOneId'] as String,
    address: json['address'] == null
        ? null
        : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    distance: json['distance'] as num,
    timeSlots: (json['timeSlots'] as List)?.map((e) => e as num)?.toList(),
    startTimestamp: firestoreTimestampFromJson(json['startTimestamp']),
    endTimestamp: firestoreTimestampFromJson(json['endTimestamp']),
    hourlyRate: json['hourlyRate'] as num,
    hoursCount: json['hoursCount'] as num,
    totalCost: json['totalCost'] as num,
    createdBy: json['createdBy'] as String,
    accepted: json['accepted'] as bool,
    acceptedAt: firestoreTimestampFromJson(json['acceptedAt']),
    rejected: json['rejected'] as bool,
    rejectedAt: firestoreTimestampFromJson(json['rejectedAt']),
    completed: json['completed'] as bool,
    completedAt: firestoreTimestampFromJson(json['completedAt']),
    canceled: json['canceled'] as bool,
    canceledAt: firestoreTimestampFromJson(json['canceledAt']),
    canceledBy: json['canceledBy'] as String,
    reviewedByAdvocate: json['reviewedByAdvocate'] as bool,
    reviewedByAdvocateAt:
        firestoreTimestampFromJson(json['reviewedByAdvocateAt']),
    reviewedByJoygiver: json['reviewedByJoygiver'] as bool,
    reviewedByJoygiverAt:
        firestoreTimestampFromJson(json['reviewedByJoygiverAt']),
    disputed: json['disputed'] as bool,
    disputedAt: firestoreTimestampFromJson(json['disputedAt']),
    expiresAt: firestoreTimestampFromJson(json['expiresAt']),
    expired: json['expired'] as bool,
    stripeCustomerId: json['stripeCustomerId'] as String,
    stripePaymentIntentHoldCaptured:
        json['stripePaymentIntentHoldCaptured'] as bool,
    stripeAccountId: json['stripeAccountId'] as String,
    stripePaymentIntentId: json['stripePaymentIntentId'] as String,
    stripePaymentMethodId: json['stripePaymentMethodId'] as String,
    stripeTransferId: json['stripeTransferId'] as String,
  );
}

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'joygiverId': instance.joygiverId,
      'advocateId': instance.advocateId,
      'lovedOneId': instance.lovedOneId,
      'address': instance.address,
      'distance': instance.distance,
      'timeSlots': instance.timeSlots,
      'startTimestamp': firestoreTimestampToJson(instance.startTimestamp),
      'endTimestamp': firestoreTimestampToJson(instance.endTimestamp),
      'hourlyRate': instance.hourlyRate,
      'hoursCount': instance.hoursCount,
      'totalCost': instance.totalCost,
      'createdBy': instance.createdBy,
      'accepted': instance.accepted,
      'acceptedAt': firestoreTimestampToJson(instance.acceptedAt),
      'rejected': instance.rejected,
      'rejectedAt': firestoreTimestampToJson(instance.rejectedAt),
      'completed': instance.completed,
      'completedAt': firestoreTimestampToJson(instance.completedAt),
      'canceled': instance.canceled,
      'canceledAt': firestoreTimestampToJson(instance.canceledAt),
      'canceledBy': instance.canceledBy,
      'reviewedByAdvocate': instance.reviewedByAdvocate,
      'reviewedByAdvocateAt':
          firestoreTimestampToJson(instance.reviewedByAdvocateAt),
      'reviewedByJoygiver': instance.reviewedByJoygiver,
      'reviewedByJoygiverAt':
          firestoreTimestampToJson(instance.reviewedByJoygiverAt),
      'disputed': instance.disputed,
      'disputedAt': firestoreTimestampToJson(instance.disputedAt),
      'expiresAt': firestoreTimestampToJson(instance.expiresAt),
      'expired': instance.expired,
      'stripeCustomerId': instance.stripeCustomerId,
      'stripePaymentIntentHoldCaptured':
          instance.stripePaymentIntentHoldCaptured,
      'stripeAccountId': instance.stripeAccountId,
      'stripePaymentIntentId': instance.stripePaymentIntentId,
      'stripePaymentMethodId': instance.stripePaymentMethodId,
      'stripeTransferId': instance.stripeTransferId,
    };
