import 'package:careyaya/models/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';

class SessionListScreen extends StatelessWidget {
  List<SessionModel> sessions = ExampleSessions().generateSessions();
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      title: 'Sessions',
      body: Column( children: [
        Expanded(child: ListView.separated(
            itemBuilder: (_, index) {
              final hasBorderBottom =
                  index == sessions.length - 1;
              final boxDecoration = hasBorderBottom
                  ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.0,
                  ),
                ),
                // borderRadius: BorderRadius.circular(5.0),
              )
                  : null;
              final session = sessions[index];
              return Container(
                key: Key(session.sessionID),
                child: ListTile(
                  leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                  title: Text('${session.hoursCount} hours with ${session.lovedOneFirstName}')
                ),
                decoration: boxDecoration,
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            ),
            itemCount: sessions.length))
      ]),
    );
  }
}
