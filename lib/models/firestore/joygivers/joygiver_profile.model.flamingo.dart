// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joygiver_profile.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum JoygiverProfileModelKey {
  email,
  phoneNumber,
  profilePicUrl,
  dob,
  visible,
  private,
  bookable,
  verified,
  verifiedAt,
  coordinates,
  stripeAccountId,
  joygiverPreferences,
  mbtiClassification,
  reviewByAdvocateCount,
  reviewByAdvocateStarCount,
  reviewByFriendCount,
  reviewByFriendStarCount,
  rating,
  requestedSessionCount,
  acceptedSessionCount,
  rejectedSessionCount,
  completedSessionCount,
  canceledSessionCount,
  disputedSessionCount,
  totalSessionResponseMinutes,
  advocateIds,
  approved,
  approvedAt,
  introVideoUrl,
  coverVideoUrl,
  profileImages,
  introDescription,
  yearsExperience,
  hasTransportation,
  sex,
  isSmoker,
  drives,
  isComfortableWithPets,
  certificationsList,
  certificationUrls,
  hourlyRate,
  languages,
  hobbies,
  tasks,
  skills,
  covidHandlingMethods,
  baseWeekAvailableSlots,
  schedulingFlexibility,
  interviewQuestions,
  thirdPartyQuotes,
  experienceDescription,
  name,
  address,
}

extension JoygiverProfileModelKeyExtension on JoygiverProfileModelKey {
  String get value {
    switch (this) {
      case JoygiverProfileModelKey.email:
        return 'email';
      case JoygiverProfileModelKey.phoneNumber:
        return 'phoneNumber';
      case JoygiverProfileModelKey.profilePicUrl:
        return 'profilePicUrl';
      case JoygiverProfileModelKey.dob:
        return 'dob';
      case JoygiverProfileModelKey.visible:
        return 'visible';
      case JoygiverProfileModelKey.private:
        return 'private';
      case JoygiverProfileModelKey.bookable:
        return 'bookable';
      case JoygiverProfileModelKey.verified:
        return 'verified';
      case JoygiverProfileModelKey.verifiedAt:
        return 'verifiedAt';
      case JoygiverProfileModelKey.coordinates:
        return 'coordinates';
      case JoygiverProfileModelKey.stripeAccountId:
        return 'stripeAccountId';
      case JoygiverProfileModelKey.joygiverPreferences:
        return 'joygiverPreferences';
      case JoygiverProfileModelKey.mbtiClassification:
        return 'mbtiClassification';
      case JoygiverProfileModelKey.reviewByAdvocateCount:
        return 'reviewByAdvocateCount';
      case JoygiverProfileModelKey.reviewByAdvocateStarCount:
        return 'reviewByAdvocateStarCount';
      case JoygiverProfileModelKey.reviewByFriendCount:
        return 'reviewByFriendCount';
      case JoygiverProfileModelKey.reviewByFriendStarCount:
        return 'reviewByFriendStarCount';
      case JoygiverProfileModelKey.rating:
        return 'rating';
      case JoygiverProfileModelKey.requestedSessionCount:
        return 'requestedSessionCount';
      case JoygiverProfileModelKey.acceptedSessionCount:
        return 'acceptedSessionCount';
      case JoygiverProfileModelKey.rejectedSessionCount:
        return 'rejectedSessionCount';
      case JoygiverProfileModelKey.completedSessionCount:
        return 'completedSessionCount';
      case JoygiverProfileModelKey.canceledSessionCount:
        return 'canceledSessionCount';
      case JoygiverProfileModelKey.disputedSessionCount:
        return 'disputedSessionCount';
      case JoygiverProfileModelKey.totalSessionResponseMinutes:
        return 'totalSessionResponseMinutes';
      case JoygiverProfileModelKey.advocateIds:
        return 'advocateIds';
      case JoygiverProfileModelKey.approved:
        return 'approved';
      case JoygiverProfileModelKey.approvedAt:
        return 'approvedAt';
      case JoygiverProfileModelKey.introVideoUrl:
        return 'introVideoUrl';
      case JoygiverProfileModelKey.coverVideoUrl:
        return 'coverVideoUrl';
      case JoygiverProfileModelKey.profileImages:
        return 'profileImages';
      case JoygiverProfileModelKey.introDescription:
        return 'introDescription';
      case JoygiverProfileModelKey.yearsExperience:
        return 'yearsExperience';
      case JoygiverProfileModelKey.hasTransportation:
        return 'hasTransportation';
      case JoygiverProfileModelKey.sex:
        return 'sex';
      case JoygiverProfileModelKey.isSmoker:
        return 'isSmoker';
      case JoygiverProfileModelKey.drives:
        return 'drives';
      case JoygiverProfileModelKey.isComfortableWithPets:
        return 'isComfortableWithPets';
      case JoygiverProfileModelKey.certificationsList:
        return 'certificationsList';
      case JoygiverProfileModelKey.certificationUrls:
        return 'certificationUrls';
      case JoygiverProfileModelKey.hourlyRate:
        return 'hourlyRate';
      case JoygiverProfileModelKey.languages:
        return 'languages';
      case JoygiverProfileModelKey.hobbies:
        return 'hobbies';
      case JoygiverProfileModelKey.tasks:
        return 'tasks';
      case JoygiverProfileModelKey.skills:
        return 'skills';
      case JoygiverProfileModelKey.covidHandlingMethods:
        return 'covidHandlingMethods';
      case JoygiverProfileModelKey.baseWeekAvailableSlots:
        return 'baseWeekAvailableSlots';
      case JoygiverProfileModelKey.schedulingFlexibility:
        return 'schedulingFlexibility';
      case JoygiverProfileModelKey.interviewQuestions:
        return 'interviewQuestions';
      case JoygiverProfileModelKey.thirdPartyQuotes:
        return 'thirdPartyQuotes';
      case JoygiverProfileModelKey.experienceDescription:
        return 'experienceDescription';
      case JoygiverProfileModelKey.name:
        return 'name';
      case JoygiverProfileModelKey.address:
        return 'address';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(JoygiverProfileModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'profilePicUrl', doc.profilePicUrl);
  Helper.writeNotNull(data, 'dob', doc.dob);
  Helper.writeNotNull(data, 'visible', doc.visible);
  Helper.writeNotNull(data, 'private', doc.private);
  Helper.writeNotNull(data, 'bookable', doc.bookable);
  Helper.writeNotNull(data, 'verified', doc.verified);
  Helper.writeNotNull(data, 'verifiedAt', doc.verifiedAt);
  Helper.writeNotNull(data, 'coordinates', doc.coordinates);
  Helper.writeNotNull(data, 'stripeAccountId', doc.stripeAccountId);
  Helper.writeNotNull(data, 'joygiverPreferences', doc.joygiverPreferences);
  Helper.writeNotNull(data, 'mbtiClassification', doc.mbtiClassification);
  Helper.writeNotNull(data, 'reviewByAdvocateCount', doc.reviewByAdvocateCount);
  Helper.writeNotNull(
      data, 'reviewByAdvocateStarCount', doc.reviewByAdvocateStarCount);
  Helper.writeNotNull(data, 'reviewByFriendCount', doc.reviewByFriendCount);
  Helper.writeNotNull(
      data, 'reviewByFriendStarCount', doc.reviewByFriendStarCount);
  Helper.writeNotNull(data, 'rating', doc.rating);
  Helper.writeNotNull(data, 'requestedSessionCount', doc.requestedSessionCount);
  Helper.writeNotNull(data, 'acceptedSessionCount', doc.acceptedSessionCount);
  Helper.writeNotNull(data, 'rejectedSessionCount', doc.rejectedSessionCount);
  Helper.writeNotNull(data, 'completedSessionCount', doc.completedSessionCount);
  Helper.writeNotNull(data, 'canceledSessionCount', doc.canceledSessionCount);
  Helper.writeNotNull(data, 'disputedSessionCount', doc.disputedSessionCount);
  Helper.writeNotNull(
      data, 'totalSessionResponseMinutes', doc.totalSessionResponseMinutes);
  Helper.writeNotNull(data, 'advocateIds', doc.advocateIds);
  Helper.writeNotNull(data, 'approved', doc.approved);
  Helper.writeNotNull(data, 'approvedAt', doc.approvedAt);
  Helper.writeNotNull(data, 'introVideoUrl', doc.introVideoUrl);
  Helper.writeNotNull(data, 'coverVideoUrl', doc.coverVideoUrl);
  Helper.writeNotNull(data, 'profileImages', doc.profileImages);
  Helper.writeNotNull(data, 'introDescription', doc.introDescription);
  Helper.writeNotNull(data, 'yearsExperience', doc.yearsExperience);
  Helper.writeNotNull(data, 'hasTransportation', doc.hasTransportation);
  Helper.writeNotNull(data, 'sex', doc.sex);
  Helper.writeNotNull(data, 'isSmoker', doc.isSmoker);
  Helper.writeNotNull(data, 'drives', doc.drives);
  Helper.writeNotNull(data, 'isComfortableWithPets', doc.isComfortableWithPets);
  Helper.writeNotNull(data, 'certificationsList', doc.certificationsList);
  Helper.writeNotNull(data, 'certificationUrls', doc.certificationUrls);
  Helper.writeNotNull(data, 'hourlyRate', doc.hourlyRate);
  Helper.writeNotNull(data, 'languages', doc.languages);
  Helper.writeNotNull(data, 'hobbies', doc.hobbies);
  Helper.writeNotNull(data, 'tasks', doc.tasks);
  Helper.writeNotNull(data, 'skills', doc.skills);
  Helper.writeNotNull(data, 'covidHandlingMethods', doc.covidHandlingMethods);
  Helper.writeNotNull(
      data, 'baseWeekAvailableSlots', doc.baseWeekAvailableSlots);
  Helper.writeNotNull(data, 'schedulingFlexibility', doc.schedulingFlexibility);
  Helper.writeNotNull(data, 'interviewQuestions', doc.interviewQuestions);
  Helper.writeNotNull(data, 'thirdPartyQuotes', doc.thirdPartyQuotes);
  Helper.writeNotNull(data, 'experienceDescription', doc.experienceDescription);

  Helper.writeModelNotNull(data, 'name', doc.name);
  Helper.writeModelNotNull(data, 'address', doc.address);

  return data;
}

/// For load data
void _$fromData(JoygiverProfileModel doc, Map<String, dynamic> data) {
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.profilePicUrl = Helper.valueFromKey<String>(data, 'profilePicUrl');
  doc.dob = Helper.valueFromKey<String>(data, 'dob');
  doc.visible = Helper.valueFromKey<bool>(data, 'visible');
  doc.private = Helper.valueFromKey<bool>(data, 'private');
  doc.bookable = Helper.valueFromKey<bool>(data, 'bookable');
  doc.verified = Helper.valueFromKey<bool>(data, 'verified');
  if (data['verifiedAt'] is Map) {
    doc.verifiedAt = Helper.timestampFromMap(data, 'verifiedAt');
  } else {
    doc.verifiedAt = Helper.valueFromKey<Timestamp>(data, 'verifiedAt');
  }

  doc.coordinates = Helper.valueFromKey<dynamic>(data, 'coordinates');
  doc.stripeAccountId = Helper.valueFromKey<String>(data, 'stripeAccountId');
  doc.joygiverPreferences =
      Helper.valueFromKey<dynamic>(data, 'joygiverPreferences');
  doc.mbtiClassification =
      Helper.valueFromKey<dynamic>(data, 'mbtiClassification');
  doc.reviewByAdvocateCount =
      Helper.valueFromKey<num>(data, 'reviewByAdvocateCount');
  doc.reviewByAdvocateStarCount =
      Helper.valueFromKey<num>(data, 'reviewByAdvocateStarCount');
  doc.reviewByFriendCount =
      Helper.valueFromKey<num>(data, 'reviewByFriendCount');
  doc.reviewByFriendStarCount =
      Helper.valueFromKey<num>(data, 'reviewByFriendStarCount');
  doc.rating = Helper.valueFromKey<num>(data, 'rating');
  doc.requestedSessionCount =
      Helper.valueFromKey<num>(data, 'requestedSessionCount');
  doc.acceptedSessionCount =
      Helper.valueFromKey<num>(data, 'acceptedSessionCount');
  doc.rejectedSessionCount =
      Helper.valueFromKey<num>(data, 'rejectedSessionCount');
  doc.completedSessionCount =
      Helper.valueFromKey<num>(data, 'completedSessionCount');
  doc.canceledSessionCount =
      Helper.valueFromKey<num>(data, 'canceledSessionCount');
  doc.disputedSessionCount =
      Helper.valueFromKey<num>(data, 'disputedSessionCount');
  doc.totalSessionResponseMinutes =
      Helper.valueFromKey<num>(data, 'totalSessionResponseMinutes');
  doc.advocateIds = Helper.valueListFromKey<String>(data, 'advocateIds');
  doc.approved = Helper.valueFromKey<bool>(data, 'approved');
  if (data['approvedAt'] is Map) {
    doc.approvedAt = Helper.timestampFromMap(data, 'approvedAt');
  } else {
    doc.approvedAt = Helper.valueFromKey<Timestamp>(data, 'approvedAt');
  }

  doc.introVideoUrl = Helper.valueFromKey<String>(data, 'introVideoUrl');
  doc.coverVideoUrl = Helper.valueFromKey<String>(data, 'coverVideoUrl');
  doc.profileImages = Helper.valueListFromKey<dynamic>(data, 'profileImages');
  doc.introDescription = Helper.valueFromKey<String>(data, 'introDescription');
  doc.yearsExperience = Helper.valueFromKey<num>(data, 'yearsExperience');
  doc.hasTransportation = Helper.valueFromKey<bool>(data, 'hasTransportation');
  doc.sex = Helper.valueFromKey<String>(data, 'sex');
  doc.isSmoker = Helper.valueFromKey<bool>(data, 'isSmoker');
  doc.drives = Helper.valueFromKey<bool>(data, 'drives');
  doc.isComfortableWithPets =
      Helper.valueFromKey<bool>(data, 'isComfortableWithPets');
  doc.certificationsList =
      Helper.valueListFromKey<String>(data, 'certificationsList');
  doc.certificationUrls =
      Helper.valueListFromKey<String>(data, 'certificationUrls');
  doc.hourlyRate = Helper.valueFromKey<num>(data, 'hourlyRate');
  doc.languages = Helper.valueListFromKey<dynamic>(data, 'languages');
  doc.hobbies = Helper.valueListFromKey<String>(data, 'hobbies');
  doc.tasks = Helper.valueListFromKey<String>(data, 'tasks');
  doc.skills = Helper.valueListFromKey<String>(data, 'skills');
  doc.covidHandlingMethods =
      Helper.valueListFromKey<String>(data, 'covidHandlingMethods');
  doc.baseWeekAvailableSlots =
      Helper.valueListFromKey<int>(data, 'baseWeekAvailableSlots');
  doc.schedulingFlexibility =
      Helper.valueFromKey<bool>(data, 'schedulingFlexibility');
  doc.interviewQuestions =
      Helper.valueListFromKey<dynamic>(data, 'interviewQuestions');
  doc.thirdPartyQuotes =
      Helper.valueListFromKey<dynamic>(data, 'thirdPartyQuotes');
  doc.experienceDescription =
      Helper.valueFromKey<String>(data, 'experienceDescription');

  final _name = Helper.valueMapFromKey<String, dynamic>(data, 'name');
  if (_name != null) {
    doc.name = NameModel(values: _name);
  } else {
    doc.name = null;
  }

  final _address = Helper.valueMapFromKey<String, dynamic>(data, 'address');
  if (_address != null) {
    doc.address = AddressModel(values: _address);
  } else {
    doc.address = null;
  }
}
