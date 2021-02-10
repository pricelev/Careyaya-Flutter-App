import 'package:careyaya/controllers/location/location.controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocationController>(LocationController(), permanent: true);
  }
}
