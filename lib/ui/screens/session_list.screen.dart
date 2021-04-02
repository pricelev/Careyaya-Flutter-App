import 'package:careyaya/controllers/firestore/sessions/sessions.controller.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:careyaya/ui/widgets/loading.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/session/session_list_item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<SessionModel> sessions = ExampleSessions().generateSessions();

List<SessionModel> notCanceledRejectedSession = ExampleSessions()
    .generateSessions()
    .where((session) => !session.canceled && !session.rejected)
    .toList();

List<SessionModel> requestedSessions = ExampleSessions()
    .generateSessions()
    .where((session) => !session.canceled && !session.rejected)
    .where((session) => !session.accepted)
    .toList();
List<SessionModel> upcomingSessions = ExampleSessions()
    .generateSessions()
    .where((session) => !session.canceled && !session.rejected)
    .where((session) => session.accepted && !session.completed)
    .toList();
List<SessionModel> completedSessions = ExampleSessions()
    .generateSessions()
    .where((session) => !session.canceled && !session.rejected)
    .where((session) => session.completed)
    .toList();
List<SessionModel> rejectedSessions = ExampleSessions()
    .generateSessions()
    .where((session) => session.rejected)
    .toList();

class SessionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreenLayout(
      title: 'Sessions',
      body: Container(
          child: GetX<SessionsController>(
        init: Get.put<SessionsController>(SessionsController()),
        builder: (SessionsController sessionsController) {
          final sessions = sessionsController.sessions;
          if (sessions == null) {
            return Loading();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            child: TabBar(
                                labelColor: Colors.blue,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                              Tab(text: 'Upcoming'),
                              Tab(text: 'Requested'),
                              Tab(text: 'Past'),
                              Tab(text: 'Declined'),
                            ])),
                        Container(
                            height: 500,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: .5))),
                            child: TabBarView(children: [
                              Column(children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemBuilder: (_, index) {
                                          return SessionListItem(
                                              session: upcomingSessions[index]);
                                        },
                                        itemCount: upcomingSessions.length)),
                              ]),
                              Column(children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemBuilder: (_, index) {
                                          final session =
                                              requestedSessions[index];

                                          return Container(
                                            key: Key(session.joygiverId),
                                            child: Dismissible(
                                                key: Key(session.joygiverId),
                                                child: SessionListItem(
                                                    session: session),
                                                onDismissed: (direction) {
                                                  print(direction);
                                                  if (direction ==
                                                      DismissDirection
                                                          .endToStart) {
                                                    session.rejected = true;
                                                    requestedSessions
                                                        .remove(session);
                                                    index--;
                                                  }
                                                  if (direction ==
                                                      DismissDirection
                                                          .startToEnd) {
                                                    print('right');
                                                    session.accepted = true;
                                                    requestedSessions
                                                        .remove(session);
                                                    index--;
                                                    upcomingSessions
                                                        .add(session);
                                                    print(upcomingSessions);
                                                  }
                                                }),
                                          );
                                        },
                                        itemCount: requestedSessions.length)),
                              ]), //requested item
                              Column(children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemBuilder: (_, index) {
                                          return SessionListItem(
                                              session: upcomingSessions[index]);
                                        },
                                        itemCount: completedSessions.length)),
                              ]), //completed
                              Column(children: [
                                Expanded(
                                    child: ListView.builder(
                                        itemBuilder: (_, index) {
                                          return SessionListItem(
                                              session: upcomingSessions[index]);
                                        },
                                        itemCount: rejectedSessions.length)),
                              ]), //declined
                            ]))
                      ]))
            ],
          );
        },
      )),
    );
  }
}

// ignore: camel_case_types
