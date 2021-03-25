// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum SessionModelKey {
  joygiverId,
  advocateId,
  lovedOneId,
  distance,
  timeSlots,
  startTimestamp,
  endTimestamp,
  hourlyRate,
  hoursCount,
  totalCost,
  createdBy,
  accepted,
  acceptedAt,
  rejected,
  rejectedAt,
  completed,
  completedAt,
  canceled,
  canceledAt,
  canceledBy,
  reviewedByAdvocate,
  reviewedByAdvocateAt,
  reviewedByJoygiver,
  reviewedByJoygiverAt,
  disputed,
  disputedAt,
  expiresAt,
  expired,
  stripeCustomerId,
  stripePaymentIntentHoldCaptured,
  stripeAccountId,
  stripePaymentIntentId,
  stripePaymentMethodId,
  stripeTransferId,
  address,
}

extension SessionModelKeyExtension on SessionModelKey {
  String get value {
    switch (this) {
      case SessionModelKey.joygiverId:
        return 'joygiverId';
      case SessionModelKey.advocateId:
        return 'advocateId';
      case SessionModelKey.lovedOneId:
        return 'lovedOneId';
      case SessionModelKey.distance:
        return 'distance';
      case SessionModelKey.timeSlots:
        return 'timeSlots';
      case SessionModelKey.startTimestamp:
        return 'startTimestamp';
      case SessionModelKey.endTimestamp:
        return 'endTimestamp';
      case SessionModelKey.hourlyRate:
        return 'hourlyRate';
      case SessionModelKey.hoursCount:
        return 'hoursCount';
      case SessionModelKey.totalCost:
        return 'totalCost';
      case SessionModelKey.createdBy:
        return 'createdBy';
      case SessionModelKey.accepted:
        return 'accepted';
      case SessionModelKey.acceptedAt:
        return 'acceptedAt';
      case SessionModelKey.rejected:
        return 'rejected';
      case SessionModelKey.rejectedAt:
        return 'rejectedAt';
      case SessionModelKey.completed:
        return 'completed';
      case SessionModelKey.completedAt:
        return 'completedAt';
      case SessionModelKey.canceled:
        return 'canceled';
      case SessionModelKey.canceledAt:
        return 'canceledAt';
      case SessionModelKey.canceledBy:
        return 'canceledBy';
      case SessionModelKey.reviewedByAdvocate:
        return 'reviewedByAdvocate';
      case SessionModelKey.reviewedByAdvocateAt:
        return 'reviewedByAdvocateAt';
      case SessionModelKey.reviewedByJoygiver:
        return 'reviewedByJoygiver';
      case SessionModelKey.reviewedByJoygiverAt:
        return 'reviewedByJoygiverAt';
      case SessionModelKey.disputed:
        return 'disputed';
      case SessionModelKey.disputedAt:
        return 'disputedAt';
      case SessionModelKey.expiresAt:
        return 'expiresAt';
      case SessionModelKey.expired:
        return 'expired';
      case SessionModelKey.stripeCustomerId:
        return 'stripeCustomerId';
      case SessionModelKey.stripePaymentIntentHoldCaptured:
        return 'stripePaymentIntentHoldCaptured';
      case SessionModelKey.stripeAccountId:
        return 'stripeAccountId';
      case SessionModelKey.stripePaymentIntentId:
        return 'stripePaymentIntentId';
      case SessionModelKey.stripePaymentMethodId:
        return 'stripePaymentMethodId';
      case SessionModelKey.stripeTransferId:
        return 'stripeTransferId';
      case SessionModelKey.address:
        return 'address';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(SessionModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'joygiverId', doc.joygiverId);
  Helper.writeNotNull(data, 'advocateId', doc.advocateId);
  Helper.writeNotNull(data, 'lovedOneId', doc.lovedOneId);
  Helper.writeNotNull(data, 'distance', doc.distance);
  Helper.writeNotNull(data, 'timeSlots', doc.timeSlots);
  Helper.writeNotNull(data, 'startTimestamp', doc.startTimestamp);
  Helper.writeNotNull(data, 'endTimestamp', doc.endTimestamp);
  Helper.writeNotNull(data, 'hourlyRate', doc.hourlyRate);
  Helper.writeNotNull(data, 'hoursCount', doc.hoursCount);
  Helper.writeNotNull(data, 'totalCost', doc.totalCost);
  Helper.writeNotNull(data, 'createdBy', doc.createdBy);
  Helper.writeNotNull(data, 'accepted', doc.accepted);
  Helper.writeNotNull(data, 'acceptedAt', doc.acceptedAt);
  Helper.writeNotNull(data, 'rejected', doc.rejected);
  Helper.writeNotNull(data, 'rejectedAt', doc.rejectedAt);
  Helper.writeNotNull(data, 'completed', doc.completed);
  Helper.writeNotNull(data, 'completedAt', doc.completedAt);
  Helper.writeNotNull(data, 'canceled', doc.canceled);
  Helper.writeNotNull(data, 'canceledAt', doc.canceledAt);
  Helper.writeNotNull(data, 'canceledBy', doc.canceledBy);
  Helper.writeNotNull(data, 'reviewedByAdvocate', doc.reviewedByAdvocate);
  Helper.writeNotNull(data, 'reviewedByAdvocateAt', doc.reviewedByAdvocateAt);
  Helper.writeNotNull(data, 'reviewedByJoygiver', doc.reviewedByJoygiver);
  Helper.writeNotNull(data, 'reviewedByJoygiverAt', doc.reviewedByJoygiverAt);
  Helper.writeNotNull(data, 'disputed', doc.disputed);
  Helper.writeNotNull(data, 'disputedAt', doc.disputedAt);
  Helper.writeNotNull(data, 'expiresAt', doc.expiresAt);
  Helper.writeNotNull(data, 'expired', doc.expired);
  Helper.writeNotNull(data, 'stripeCustomerId', doc.stripeCustomerId);
  Helper.writeNotNull(data, 'stripePaymentIntentHoldCaptured',
      doc.stripePaymentIntentHoldCaptured);
  Helper.writeNotNull(data, 'stripeAccountId', doc.stripeAccountId);
  Helper.writeNotNull(data, 'stripePaymentIntentId', doc.stripePaymentIntentId);
  Helper.writeNotNull(data, 'stripePaymentMethodId', doc.stripePaymentMethodId);
  Helper.writeNotNull(data, 'stripeTransferId', doc.stripeTransferId);

  Helper.writeModelNotNull(data, 'address', doc.address);

  return data;
}

/// For load data
void _$fromData(SessionModel doc, Map<String, dynamic> data) {
  doc.joygiverId = Helper.valueFromKey<String>(data, 'joygiverId');
  doc.advocateId = Helper.valueFromKey<String>(data, 'advocateId');
  doc.lovedOneId = Helper.valueFromKey<String>(data, 'lovedOneId');
  doc.distance = Helper.valueFromKey<num>(data, 'distance');
  doc.timeSlots = Helper.valueListFromKey<num>(data, 'timeSlots');
  if (data['startTimestamp'] is Map) {
    doc.startTimestamp = Helper.timestampFromMap(data, 'startTimestamp');
  } else {
    doc.startTimestamp = Helper.valueFromKey<Timestamp>(data, 'startTimestamp');
  }

  if (data['endTimestamp'] is Map) {
    doc.endTimestamp = Helper.timestampFromMap(data, 'endTimestamp');
  } else {
    doc.endTimestamp = Helper.valueFromKey<Timestamp>(data, 'endTimestamp');
  }

  doc.hourlyRate = Helper.valueFromKey<num>(data, 'hourlyRate');
  doc.hoursCount = Helper.valueFromKey<num>(data, 'hoursCount');
  doc.totalCost = Helper.valueFromKey<num>(data, 'totalCost');
  doc.createdBy = Helper.valueFromKey<String>(data, 'createdBy');
  doc.accepted = Helper.valueFromKey<bool>(data, 'accepted');
  if (data['acceptedAt'] is Map) {
    doc.acceptedAt = Helper.timestampFromMap(data, 'acceptedAt');
  } else {
    doc.acceptedAt = Helper.valueFromKey<Timestamp>(data, 'acceptedAt');
  }

  doc.rejected = Helper.valueFromKey<bool>(data, 'rejected');
  if (data['rejectedAt'] is Map) {
    doc.rejectedAt = Helper.timestampFromMap(data, 'rejectedAt');
  } else {
    doc.rejectedAt = Helper.valueFromKey<Timestamp>(data, 'rejectedAt');
  }

  doc.completed = Helper.valueFromKey<bool>(data, 'completed');
  if (data['completedAt'] is Map) {
    doc.completedAt = Helper.timestampFromMap(data, 'completedAt');
  } else {
    doc.completedAt = Helper.valueFromKey<Timestamp>(data, 'completedAt');
  }

  doc.canceled = Helper.valueFromKey<bool>(data, 'canceled');
  if (data['canceledAt'] is Map) {
    doc.canceledAt = Helper.timestampFromMap(data, 'canceledAt');
  } else {
    doc.canceledAt = Helper.valueFromKey<Timestamp>(data, 'canceledAt');
  }

  doc.canceledBy = Helper.valueFromKey<String>(data, 'canceledBy');
  doc.reviewedByAdvocate =
      Helper.valueFromKey<bool>(data, 'reviewedByAdvocate');
  if (data['reviewedByAdvocateAt'] is Map) {
    doc.reviewedByAdvocateAt =
        Helper.timestampFromMap(data, 'reviewedByAdvocateAt');
  } else {
    doc.reviewedByAdvocateAt =
        Helper.valueFromKey<Timestamp>(data, 'reviewedByAdvocateAt');
  }

  doc.reviewedByJoygiver =
      Helper.valueFromKey<bool>(data, 'reviewedByJoygiver');
  if (data['reviewedByJoygiverAt'] is Map) {
    doc.reviewedByJoygiverAt =
        Helper.timestampFromMap(data, 'reviewedByJoygiverAt');
  } else {
    doc.reviewedByJoygiverAt =
        Helper.valueFromKey<Timestamp>(data, 'reviewedByJoygiverAt');
  }

  doc.disputed = Helper.valueFromKey<bool>(data, 'disputed');
  if (data['disputedAt'] is Map) {
    doc.disputedAt = Helper.timestampFromMap(data, 'disputedAt');
  } else {
    doc.disputedAt = Helper.valueFromKey<Timestamp>(data, 'disputedAt');
  }

  if (data['expiresAt'] is Map) {
    doc.expiresAt = Helper.timestampFromMap(data, 'expiresAt');
  } else {
    doc.expiresAt = Helper.valueFromKey<Timestamp>(data, 'expiresAt');
  }

  doc.expired = Helper.valueFromKey<bool>(data, 'expired');
  doc.stripeCustomerId = Helper.valueFromKey<String>(data, 'stripeCustomerId');
  doc.stripePaymentIntentHoldCaptured =
      Helper.valueFromKey<bool>(data, 'stripePaymentIntentHoldCaptured');
  doc.stripeAccountId = Helper.valueFromKey<String>(data, 'stripeAccountId');
  doc.stripePaymentIntentId =
      Helper.valueFromKey<String>(data, 'stripePaymentIntentId');
  doc.stripePaymentMethodId =
      Helper.valueFromKey<String>(data, 'stripePaymentMethodId');
  doc.stripeTransferId = Helper.valueFromKey<String>(data, 'stripeTransferId');

  final _address = Helper.valueMapFromKey<String, dynamic>(data, 'address');
  if (_address != null) {
    doc.address = AddressModel(values: _address);
  } else {
    doc.address = null;
  }
}
