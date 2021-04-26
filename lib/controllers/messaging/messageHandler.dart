import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageHandler extends StatefulWidget {
  @override
  createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _fcm.configure(onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
      final snackbar = SnackBar(
          content: Text(message['notificaiton']['title']),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () => null,
          ));
      Scaffold.of(context).showSnackBar(snackbar);
    }, onResume: (Map<String, dynamic> message) async {
      print('onMessage: $message');
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: ListTile(
                    title: Text(message['notificaiton']['title']),
                    subtitle: Text(message['notificaiton']['body'])),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('ok'))
                ],
              ));
    }, onLaunch: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    });
    if (Platform.isIOS) {
      var iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  // Get the token, save it tot the database for current user
  _saveDeviceToken() async {
    // Get the current user
    String uid = 'test';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokenRef =
          _db.collection('users').doc(uid).collection('tokens').doc(fcmToken);

      await tokenRef.set({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),
        'platform': Platform.operatingSystem
      });
    }
  }
}
