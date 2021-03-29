import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/session/session.detail.widget.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
        title: "Session",
        body: SessionDetailWidget(

        )
    );
  }
}