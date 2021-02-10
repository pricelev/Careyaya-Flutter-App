import 'package:meta/meta.dart';

// This is super incomplete; only being used to keep track
// of whether someone is an approved caregiver, and hold
// application values

class CaregiverProfileModel {
  String id;
  bool approved;
  Map<String, dynamic> name;
  String email;
  String profilePicUrl;
  String introVideoUrl;
  int yearsExperience;
  bool hasTransportation;
  String sex;
  bool isSmoker;
  bool drives;
  bool isComfortableWithPets;
  List<String> certificationsList;
  List<String> certificationsUrls;
  int hourlyRate;
  List<Map<String, String>> languages;
  List<String> hobbies;
  List<int> baseWeekAvailableSlots;

  CaregiverProfileModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.profilePicUrl,
      @required this.approved});

  factory CaregiverProfileModel.fromMap(Map data, String caregiverId) {
    return CaregiverProfileModel(
      id: caregiverId,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      profilePicUrl: data['profilePicUrl'] ?? '',
      approved: data['approved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "approved": approved,
        "email": email,
        "name": name,
        "profilePicUrl": profilePicUrl
      };
}
