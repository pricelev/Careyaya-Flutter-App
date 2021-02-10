import 'package:careyaya/models/caregivers/caregiver_profile.model.dart';
import 'package:meta/meta.dart';

// This is super incomplete; only being used to keep track
// of whether someone is an approved caregiver

class CaregiverApplicationModel extends CaregiverProfileModel {
  String id;
  bool approved;
  Map<String, dynamic> name;
  String email;
  String profilePicUrl;

  CaregiverApplicationModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.profilePicUrl,
      @required this.approved});

  factory CaregiverApplicationModel.fromMap(Map data, String caregiverId) {
    return CaregiverApplicationModel(
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
