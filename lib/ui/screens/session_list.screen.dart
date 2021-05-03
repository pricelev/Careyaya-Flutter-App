import 'package:careyaya/controllers/firestore/sessions/sessions.controller.dart';
import 'package:careyaya/ui/widgets/loading.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/sessions/session_list_tabs.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MainScreenLayout(
      title: 'Sessions',
      body: GetX<SessionsController>(
        init: Get.put<SessionsController>(SessionsController()),
        builder: (SessionsController sessionsController) {
          final sessions = sessionsController.sessions;

          if (sessions == null) {
            return Loading();
          }
          return SessionListTabs(
            sessions: sessions,
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
