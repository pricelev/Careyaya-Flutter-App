// Have these values autocomplete
import 'package:careyaya/ui/widgets/forms/form.widget.dart';

class CaregiverApplicationValues extends FormValuesInterface {
  final String firstName;
  final String lastName;
  final String sex;
  final String email;
  // final Address address;
  final String phoneNumber;
  final String experienceDescription;
  final int yearsExperience;
  final int hourlyRate;
  // weekly schedule information
  final String
      weeklySchedule; // currently a placeholder, actual weekly availability info will need to be in a different format
  // Joygiver identity information
  final DateTime birthdate;
  final int ssn;
  final int driversLicenseNumber;
  // Joygiver Profile information
  final String intro;
  final hobbies;
  final foreignLanguages;
  final preferences;
  final String challengingSituation;
  final String situational;
  final String selfPitch;
  // Service information
  final tasks;
  final experienceSelection;
  final certifications;
  final String sexPreference;
  final String maxDistance;
  final covidPrevention;
  // Reference information
  final String reference1Name;
  final String reference1Relationship;
  final int reference1PhoneNumber;
  final String reference1Email;
  final String reference2Name;
  final String reference2Relationship;
  final int reference2PhoneNumber;
  final String reference2Email;
  // Meeting information
  final DateTime meetingDateTime;

  CaregiverApplicationValues.fromJson(Map<String, dynamic> map)
      : this.firstName = map['firstName'],
        this.lastName = map['lastName'],
        this.sex = map['sex'],
        this.email = map['email'],
        // this.address = map['address'], // Need to convert Address from Map
        this.phoneNumber = map['phoneNumber'],
        this.yearsExperience = int.parse(map['yearsExperience']),
        this.experienceDescription = map['experienceDescription'],
        this.hourlyRate = int.parse(map['hourlyRate']),
        this.weeklySchedule = map['weeklySchedule'],
        this.birthdate = DateTime.parse(map['birthdate']),
        this.ssn = int.parse(map['ssn']),
        this.driversLicenseNumber = int.parse(map['driversLicenseNumber']),
        this.intro = map['intro'],
        this.hobbies = map['hobbies'],
        this.foreignLanguages = map['foreignLanguages'],
        this.preferences = map['preferences'],
        this.challengingSituation = map['challengingSituation'],
        this.situational = map['situational'],
        this.selfPitch = map['selfPitch'],
        this.tasks = map['tasks'],
        this.experienceSelection = map['experienceSelection'],
        this.certifications = map['certifications'],
        this.sexPreference = map['sexPreference'],
        this.maxDistance = map['maxDistance'],
        this.covidPrevention = map['covidPrevention'],
        this.reference1Name = map['reference1Name'],
        this.reference1Relationship = map['reference1Relationship'],
        this.reference1PhoneNumber = int.parse(map['reference1PhoneNumber']),
        this.reference1Email = map['reference1Email'],
        this.reference2Name = map['reference2Name'],
        this.reference2Relationship = map['reference2Relationship'],
        this.reference2PhoneNumber = int.parse(map['reference2PhoneNumber']),
        this.reference2Email = map['reference2Email'],
        this.meetingDateTime = DateTime.parse(map['meetingDateTime']),
        super.fromJson(null);
}
