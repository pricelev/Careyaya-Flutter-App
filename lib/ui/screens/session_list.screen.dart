import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careyaya/constants/routes.dart';


class SessionListScreen extends StatelessWidget {

  List<SessionModel> sessions = ExampleSessions().generateSessions();


  List<SessionModel> notCanceledRejectedSession = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).toList();

  List<SessionModel> requestedSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => !session.accepted).toList();
  List<SessionModel> upcomingSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => session.accepted &&!session.completed).toList();
  List<SessionModel> completedSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => session.completed).toList();
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      title: 'Sessions',
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            DefaultTabController(
              length:4,
              initialIndex:0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'upcoming'),
                        Tab(text: 'requested'),
                        Tab(text: 'past'),
                        Tab(text: 'declined'),
                      ]

                    )
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width:.5))
                    ),
                    child:TabBarView(
                      children:[
                        Column( children: [
                          Expanded(child: ListView.builder(
                              itemBuilder: (_, index) {
                                print(  upcomingSessions.length);
                                final hasBorderBottom =
                                    index == upcomingSessions.length - 1;
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
                                final session = upcomingSessions[index];
                                return Container(
                                  key: Key(session.joygiverId),
                                  child: Card(child:
                                  ListTile(
                                    leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                                    title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
                                    onTap: _onTap,
                                  )),
                                ); //upcomingsessions
                              },
                              itemCount: upcomingSessions.length)),
                        ]),
                        Column( children: [
                          Expanded(child: ListView.builder(
                              itemBuilder: (_, index) {
                                print(  requestedSessions.length);
                                final hasBorderBottom =
                                    index == requestedSessions.length - 1;
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
                                final session = notCanceledRejectedSession[index];
                                return Container(
                                  key: Key(session.joygiverId),
                                  child: Card(child:
                                  ListTile(
                                    leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                                    title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
                                    onTap: _onTap,
                                  )),
                                );
                              },
                              itemCount: requestedSessions.length)),
                        ]),//requested item
                        Column( children: [
                          Expanded(child: ListView.builder(
                              itemBuilder: (_, index) {
                                print(  completedSessions.length);
                                final hasBorderBottom =
                                    index == completedSessions.length - 1;
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
                                final session = completedSessions[index];
                                return Container(
                                  key: Key(session.joygiverId),
                                  child: Card(child:
                                  ListTile(
                                    leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                                    title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
                                    onTap: _onTap,
                                  )),
                                );
                              },
                              itemCount: completedSessions.length)),
                        ]),//completed
                        Column( children: [
                          Expanded(child: ListView.builder(
                              itemBuilder: (_, index) {
                                print(  requestedSessions.length);
                                final hasBorderBottom =
                                    index == requestedSessions.length - 1;
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
                                final session = notCanceledRejectedSession[index];
                                return Container(
                                  key: Key(session.joygiverId),
                                  child: Card(child:
                                  ListTile(
                                    leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                                    title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
                                    onTap: _onTap,
                                  )),
                                );
                              },
                              itemCount: requestedSessions.length)),
                        ]),//declined
                      ]
                    )
                  )
                ]
              )
            )
          ]
        ),
      ),

        );
  }

  void _onTap() {
    Get.toNamed(
      SESSION_ROUTE,
      arguments: {
        'sessionId': this.sessions[0].id
      }
    );
  }
}
