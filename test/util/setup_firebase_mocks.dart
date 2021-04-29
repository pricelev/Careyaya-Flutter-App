import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _setupCloudFirestoreMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
            'storageBucket': '123',
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    return null;
  });
}

Future<void> setupFirebaseMocks() async {
  /// Configure
  await _setupCloudFirestoreMocks();

  await Flamingo.initializeApp();
  final firestore = MockFirestoreInstance();

  Flamingo.overrideWithSetting(
    firestoreInstance: firestore,
    rootPath: 'test/v1',
    settings: Settings(
      // persistenceEnabled: false,
      sslEnabled: false,
      host: '192.168.100.9:8080',
    ),
  );
}
