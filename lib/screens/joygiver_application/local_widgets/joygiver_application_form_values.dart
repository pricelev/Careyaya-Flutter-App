// // Have these values autocomplete
// import 'package:careyaya/widgets/forms/form.widget.dart';

// class CaregiverApplicationValues extends FormValuesInterface {
//   final String firstName;
//   final String lastName;
//   final String sex;
//   final String email;
//   // final Address address;
//   final String phoneNumber;
//   final String experienceDescription;
//   final int yearsExperience;
//   final int hourlyRate;
//   // weekly schedule information
//   final String
//       weeklySchedule; // currently a placeholder, actual weekly availability info will need to be in a different format
//   // Joygiver identity information
//   final DateTime birthdate;
//   final int ssn;
//   final int driversLicenseNumber;
//   // Joygiver Profile information
//   final String intro;
//   final hobbies;
//   final foreignLanguages;
//   final preferences;
//   final String challengingSituation;
//   final String situational;
//   final String selfPitch;
//   // Service information
//   final tasks;
//   final experienceSelection;
//   final certifications;
//   final String sexPreference;
//   final String maxDistance;
//   final covidPrevention;
//   // Reference information
//   final String reference1Name;
//   final String reference1Relationship;
//   final int reference1PhoneNumber;
//   final String reference1Email;
//   final String reference2Name;
//   final String reference2Relationship;
//   final int reference2PhoneNumber;
//   final String reference2Email;
//   // Meeting information
//   final DateTime meetingDateTime;

//   CaregiverApplicationValues.fromJson(Map<String, dynamic> map)
//       : firstName = map['firstName'],
//         lastName = map['lastName'],
//         sex = map['sex'],
//         email = map['email'],
//         // address = map['address'], // Need to convert Address from Map
//         phoneNumber = map['phoneNumber'],
//         yearsExperience = int.parse(map['yearsExperience']),
//         experienceDescription = map['experienceDescription'],
//         hourlyRate = int.parse(map['hourlyRate']),
//         weeklySchedule = map['weeklySchedule'],
//         birthdate = DateTime.parse(map['birthdate']),
//         ssn = int.parse(map['ssn']),
//         driversLicenseNumber = int.parse(map['driversLicenseNumber']),
//         intro = map['intro'],
//         hobbies = map['hobbies'],
//         foreignLanguages = map['foreignLanguages'],
//         preferences = map['preferences'],
//         challengingSituation = map['challengingSituation'],
//         situational = map['situational'],
//         selfPitch = map['selfPitch'],
//         tasks = map['tasks'],
//         experienceSelection = map['experienceSelection'],
//         certifications = map['certifications'],
//         sexPreference = map['sexPreference'],
//         maxDistance = map['maxDistance'],
//         covidPrevention = map['covidPrevention'],
//         reference1Name = map['reference1Name'],
//         reference1Relationship = map['reference1Relationship'],
//         reference1PhoneNumber = int.parse(map['reference1PhoneNumber']),
//         reference1Email = map['reference1Email'],
//         reference2Name = map['reference2Name'],
//         reference2Relationship = map['reference2Relationship'],
//         reference2PhoneNumber = int.parse(map['reference2PhoneNumber']),
//         reference2Email = map['reference2Email'],
//         meetingDateTime = DateTime.parse(map['meetingDateTime']),
//         super.fromJson(null);
// }
