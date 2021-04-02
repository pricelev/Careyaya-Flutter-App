// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_review_by_joygiver.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum SessionReviewByJoygiverModelKey {
  advocateId,
  joygiverId,
  changeInAssistance,
  verballyAggressive,
  physicallyAggressive,
  noncompliant,
  triedToLeave,
  emotionalDistress,
  difficultySwallowing,
  difficultyEating,
  fell,
  otherMedicalIssues,
  cognitiveFunctioningRating,
  physicalFunctioningRating,
  moodRating,
  overallExperienceRating,
  description,
  activitiesDescription,
}

extension SessionReviewByJoygiverModelKeyExtension
    on SessionReviewByJoygiverModelKey {
  String get value {
    switch (this) {
      case SessionReviewByJoygiverModelKey.advocateId:
        return 'advocateId';
      case SessionReviewByJoygiverModelKey.joygiverId:
        return 'joygiverId';
      case SessionReviewByJoygiverModelKey.changeInAssistance:
        return 'changeInAssistance';
      case SessionReviewByJoygiverModelKey.verballyAggressive:
        return 'verballyAggressive';
      case SessionReviewByJoygiverModelKey.physicallyAggressive:
        return 'physicallyAggressive';
      case SessionReviewByJoygiverModelKey.noncompliant:
        return 'noncompliant';
      case SessionReviewByJoygiverModelKey.triedToLeave:
        return 'triedToLeave';
      case SessionReviewByJoygiverModelKey.emotionalDistress:
        return 'emotionalDistress';
      case SessionReviewByJoygiverModelKey.difficultySwallowing:
        return 'difficultySwallowing';
      case SessionReviewByJoygiverModelKey.difficultyEating:
        return 'difficultyEating';
      case SessionReviewByJoygiverModelKey.fell:
        return 'fell';
      case SessionReviewByJoygiverModelKey.otherMedicalIssues:
        return 'otherMedicalIssues';
      case SessionReviewByJoygiverModelKey.cognitiveFunctioningRating:
        return 'cognitiveFunctioningRating';
      case SessionReviewByJoygiverModelKey.physicalFunctioningRating:
        return 'physicalFunctioningRating';
      case SessionReviewByJoygiverModelKey.moodRating:
        return 'moodRating';
      case SessionReviewByJoygiverModelKey.overallExperienceRating:
        return 'overallExperienceRating';
      case SessionReviewByJoygiverModelKey.description:
        return 'description';
      case SessionReviewByJoygiverModelKey.activitiesDescription:
        return 'activitiesDescription';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(SessionReviewByJoygiverModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'advocateId', doc.advocateId);
  Helper.writeNotNull(data, 'joygiverId', doc.joygiverId);
  Helper.writeNotNull(data, 'changeInAssistance', doc.changeInAssistance);
  Helper.writeNotNull(data, 'verballyAggressive', doc.verballyAggressive);
  Helper.writeNotNull(data, 'physicallyAggressive', doc.physicallyAggressive);
  Helper.writeNotNull(data, 'noncompliant', doc.noncompliant);
  Helper.writeNotNull(data, 'triedToLeave', doc.triedToLeave);
  Helper.writeNotNull(data, 'emotionalDistress', doc.emotionalDistress);
  Helper.writeNotNull(data, 'difficultySwallowing', doc.difficultySwallowing);
  Helper.writeNotNull(data, 'difficultyEating', doc.difficultyEating);
  Helper.writeNotNull(data, 'fell', doc.fell);
  Helper.writeNotNull(data, 'otherMedicalIssues', doc.otherMedicalIssues);
  Helper.writeNotNull(
      data, 'cognitiveFunctioningRating', doc.cognitiveFunctioningRating);
  Helper.writeNotNull(
      data, 'physicalFunctioningRating', doc.physicalFunctioningRating);
  Helper.writeNotNull(data, 'moodRating', doc.moodRating);
  Helper.writeNotNull(
      data, 'overallExperienceRating', doc.overallExperienceRating);
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'activitiesDescription', doc.activitiesDescription);

  return data;
}

/// For load data
void _$fromData(SessionReviewByJoygiverModel doc, Map<String, dynamic> data) {
  doc.advocateId = Helper.valueFromKey<String>(data, 'advocateId');
  doc.joygiverId = Helper.valueFromKey<String>(data, 'joygiverId');
  doc.changeInAssistance =
      Helper.valueFromKey<bool>(data, 'changeInAssistance');
  doc.verballyAggressive =
      Helper.valueFromKey<bool>(data, 'verballyAggressive');
  doc.physicallyAggressive =
      Helper.valueFromKey<bool>(data, 'physicallyAggressive');
  doc.noncompliant = Helper.valueFromKey<bool>(data, 'noncompliant');
  doc.triedToLeave = Helper.valueFromKey<bool>(data, 'triedToLeave');
  doc.emotionalDistress = Helper.valueFromKey<bool>(data, 'emotionalDistress');
  doc.difficultySwallowing =
      Helper.valueFromKey<bool>(data, 'difficultySwallowing');
  doc.difficultyEating = Helper.valueFromKey<bool>(data, 'difficultyEating');
  doc.fell = Helper.valueFromKey<bool>(data, 'fell');
  doc.otherMedicalIssues =
      Helper.valueFromKey<bool>(data, 'otherMedicalIssues');
  doc.cognitiveFunctioningRating =
      Helper.valueFromKey<num>(data, 'cognitiveFunctioningRating');
  doc.physicalFunctioningRating =
      Helper.valueFromKey<num>(data, 'physicalFunctioningRating');
  doc.moodRating = Helper.valueFromKey<String>(data, 'moodRating');
  doc.overallExperienceRating =
      Helper.valueFromKey<String>(data, 'overallExperienceRating');
  doc.description = Helper.valueFromKey<String>(data, 'description');
  doc.activitiesDescription =
      Helper.valueFromKey<String>(data, 'activitiesDescription');
}
