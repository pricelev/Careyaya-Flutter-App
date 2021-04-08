import 'package:careyaya/controllers/firestore/sessions/sessions.controller.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/ui/widgets/loading.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:careyaya/ui/widgets/sessions/session_list_item.widget.dart';
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

          List<SessionModel> notCanceledRejectedSession = sessions
              .where((session) => !session.canceled && !session.rejected)
              .toList();

          List<SessionModel> requestedSessions = sessions
              .where((session) => !session.canceled && !session.rejected)
              .where((session) => !session.accepted)
              .toList();
          List<SessionModel> upcomingSessions = sessions
              .where((session) => !session.canceled && !session.rejected)
              .where((session) => session.accepted && !session.completed)
              .toList();
          List<SessionModel> completedSessions = sessions
              .where((session) => !session.canceled && !session.rejected)
              .where((session) => session.completed)
              .toList();
          List<SessionModel> rejectedSessions =
              sessions.where((session) => session.rejected).toList();

          if (sessions == null) {
            return Loading();
          }
          return DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  labelColor: context.theme.colorScheme.secondary,
                  indicatorColor: context.theme.colorScheme.secondary,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Requested'),
                    Tab(text: 'Past'),
                    Tab(text: 'Declined'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                          itemBuilder: (_, index) {
                            return SessionListItem(
                                session: upcomingSessions[index]);
                          },
                          itemCount: upcomingSessions.length),
                      ListView.builder(
                          itemBuilder: (_, index) {
                            final session = requestedSessions[index];

                            return Container(
                              key: Key(session.joygiverId),
                              child: Dismissible(
                                  key: Key(session.joygiverId),
                                  child: SessionListItem(session: session),
                                  onDismissed: (direction) {
                                    print(direction);
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      session.rejected = true;
                                      requestedSessions.remove(session);
                                      index--;
                                    }
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      print('right');
                                      session.accepted = true;
                                      requestedSessions.remove(session);
                                      index--;
                                      upcomingSessions.add(session);
                                      print(upcomingSessions);
                                    }
                                  }),
                            );
                          },
                          itemCount: requestedSessions.length), //requested item
                      ListView.builder(
                          itemBuilder: (_, index) {
                            return SessionListItem(
                                session: upcomingSessions[index]);
                          },
                          itemCount: completedSessions.length),
                      ListView.builder(
                          itemBuilder: (_, index) {
                            return SessionListItem(
                                session: upcomingSessions[index]);
                          },
                          itemCount: rejectedSessions.length),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
