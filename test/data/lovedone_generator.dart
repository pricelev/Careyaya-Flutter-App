import 'package:careyaya/models/firestore/loved_ones/loved_one_profile.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';

class LovedOneProfileGenerator {
  LovedOneProfileGenerator._();

  static LovedOneProfileModel generateSession() {
    final faker = new Faker();

    final lovedName = 'Tory Burns';
    final phoneNumber = "9199465863";

    final joygiverId = faker.guid.guid();
    final advocateId = faker.guid.guid();
    final lovedOneId = faker.guid.guid();

    return new LovedOneProfileModel(
      id: faker.guid.guid(),
      values: {
        'name': lovedName,
        'profilePicUrl': "urlurlurl",
        'phoneNumber' : phoneNumber,
        'dob' : "12/22/2020",
        'advocateId' : '123456789'
      },
    );
  }
}
