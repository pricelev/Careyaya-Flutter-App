import 'package:careyaya/screens/session/local_controllers/session.controller.dart';
import 'package:careyaya/widgets/loading.widget.dart';
import 'package:careyaya/widgets/layout/main_screen_layout.widget.dart';
import 'package:careyaya/screens/session/local_widgets/session_detail.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String sessionId = Get.arguments['sessionId'] as String;
    return MainScreenLayout(
      title: "Session",
      body: GetX(
          init: Get.put<SessionController>(
              SessionController(sessionId: sessionId)),
          builder: (SessionController sessionController) {
            final session = sessionController.session;
            if (session == null) {
              return Loading();
            }
            return SessionDetailWidget(
              session: session,
            );
          }),
    );
  }
}
