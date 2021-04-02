import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/session/session.detail.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String sessionId = Get.arguments['sessionId'] as String;
    return MainScreenLayout(
        title: "Session",
        body: SessionDetailWidget(
          sessionId: sessionId,
        ));
  }
}
