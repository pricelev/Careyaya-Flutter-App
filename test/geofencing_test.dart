import 'package:careyaya/controllers/location/location.controller.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'data/session_generator.dart';
import 'util/setup_firebase_mocks.dart';
import 'util/wrap_with_material.dart';
import 'package:get/get.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
as bg;
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart';

Future<void> main() async {
  await setupFirebaseMocks();

  test('Add geofence', () async {
    final session = SessionGenerator.generateSession();
    LocationController.addGeofence('Home', session.address.latitude, session.address.longitude);
    final exists = bg.BackgroundGeolocation.geofenceExists('Home');
  });
}