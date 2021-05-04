// import 'package:background_location/background_location.dart';
import 'package:careyaya/screens/session_list/local_controllers/sessions.controller.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  static LocationController to = Get.find();
  SessionsController sessionsController;

  @override
  void onInit() async {
    sessionsController = Get.find<SessionsController>();
    // Configure BackgroundFetch.
    try {
      bg.BackgroundGeolocation.stop();
      await bg.BackgroundGeolocation.removeListeners();
      ////
      // 1.  Listen to events (See docs for all 12 available events).
      //

      // Fired whenever a location is recorded
      bg.BackgroundGeolocation.onLocation((bg.Location location) {
        // print('[location] - $location');
        LocationCallbackHandler.callback(location);
      }, (locationError) {
        print(locationError);
      });

      // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
      bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
        // print('[motionchange] - $location');
      });

      // Fired whenever the state of location-services changes.  Always fired at boot
      bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
        // print('[providerchange] - $event');
      });

      ////
      // 2.  Configure the plugin
      //
      final bg.State state = await bg.BackgroundGeolocation.ready(bg.Config(
          enableHeadless: true,
          desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
          distanceFilter: 10.0,
          stopOnTerminate: false,
          startOnBoot: true,
          locationUpdateInterval: 5000,
          debug: false,
          logLevel: bg.Config.LOG_LEVEL_VERBOSE));
      if (!state.enabled) {
        ////
        // 3.  Start the plugin.
        //
        bg.BackgroundGeolocation.start();
      }
    } catch (error) {
      print('[BackgroundFetch] config error: $error');
    }

    for (SessionModel session in sessionsController.sessions) {
      if (session.startTimestamp.toDate() == DateTime.now()) {
        addGeofence(session.id, session.address.latitude.toDouble(), session.address.longitude.toDouble());
      }
    }

    super.onInit();
  }

  @override
  void onClose() async {
    // await stop();
    super.onClose();
  }

  static Future<bool> _checkLocationPermission() async {
    final access = await Permission.locationAlways.status;
    switch (access) {
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        final permission = await Permission.locationAlways.request();
        if (permission == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
        break;
      case PermissionStatus.granted:
        return true;
        break;
      default:
        return false;
        break;
    }
  }
  static addGeofence(String id, double lat, double lon) {
    bg.BackgroundGeolocation.addGeofence(Geofence(
        identifier: id,
        radius: 200,
        latitude: lat,
        longitude: lon,
        notifyOnEntry: true,
        notifyOnExit: true,
        extras: {
          "route_id": 1234,
        }
    )).then((bool success) {
      print('[addGeofence] success');
    }).catchError((dynamic error) {
      print('[addGeofence] FAILURE: $error');
    });
  }
}

class LocationCallbackHandler {
  // static Future<void> initCallback(Map<dynamic, dynamic> params) async {
  //   print('location service init');
  // }

  // static Future<void> disposeCallback() async {
  //   print('location service ended');
  // }

  static Future<void> callback(bg.Location location) async {
    final timestamp = Timestamp.now();
    final timestampNumber = timestamp.millisecondsSinceEpoch;
    final timestampString = timestampNumber.toString();
    final date = timestamp.toDate();
    if (date.second < 4) {
      print('sending');
      await Firebase.initializeApp();
      final FirebaseFirestore _db = FirebaseFirestore.instance;
      final FirebaseAuth _auth = FirebaseAuth.instance;
      if (_auth != null &&
          _auth.currentUser != null &&
          _auth.currentUser.uid != null) {
        await _db
            .collection('caregiverLocations')
            .doc(_auth.currentUser.uid)
            .collection('caregiverLocations')
            .doc(timestampString)
            .set({
          'createdAt': timestamp,
          'latitude': location.coords.latitude,
          'longitude': location.coords.longitude,
        });
      }
    }
  }

  // static Future<void> notificationCallback() async {
  //   print('***notificationCallback');
  // }
}
