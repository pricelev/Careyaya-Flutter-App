import 'package:careyaya/models/caregivers/caregiver_application.model.dart';
import 'package:careyaya/models/caregivers/caregiver_profile.model.dart';
import 'package:get/get.dart';

class CaregiverController extends GetxController {
  Rx<CaregiverProfileModel> caregiverProfileDocument =
      Rx<CaregiverProfileModel>();
  Rx<CaregiverApplicationModel> caregiverApplicationDocument =
      Rx<CaregiverApplicationModel>();
}
