import 'package:careyaya/screens/session/local_controllers/session.controller.dart';
import 'package:careyaya/widgets/loading.widget.dart';
import 'package:careyaya/widgets/layout/main_screen_layout.widget.dart';
import 'package:careyaya/screens/session/local_widgets/session_detail.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careyaya/utils/session_generator.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';

class SessionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String sessionId = Get.arguments['sessionId'] as String;
    SessionModel session = SessionGenerator.generateSessions().firstWhere((element) => sessionId == element.id);
    return MainScreenLayout(
      title: "Session",
      body: SessionDetailWidget(
              session: session,
            )
    );
  }
}
