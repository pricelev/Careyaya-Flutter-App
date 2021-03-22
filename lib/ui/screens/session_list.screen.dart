import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';
import 'package:careyaya/ui/widgets/session_card.widget.dart';

class SessionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      body: Center(
        child: new SessionCard(),
      ),
      title: 'Sessions',
    );
  }
}
