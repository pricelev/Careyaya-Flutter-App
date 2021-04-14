import 'package:careyaya/controllers/firestore/sessions/session.controller.dart';
import 'package:careyaya/ui/widgets/loading.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/sessions/session_detail.widget.dart';
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
