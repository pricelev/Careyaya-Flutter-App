import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/ui/widgets/sessions/session_list_item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListTabs extends StatelessWidget {
  final List<SessionModel> sessions;

  SessionListTabs({@required this.sessions});

  @override
  Widget build(BuildContext context) {
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
                      return SessionListItem(session: upcomingSessions[index]);
                    },
                    itemCount: upcomingSessions.length),
                ListView.builder(
                    itemBuilder: (_, index) {
                      final session = requestedSessions[index];

                      return SessionListItem(
                        session: completedSessions[index],
                        onSwipeLeft: () {
                          // session.rejected = true;
                          // requestedSessions.remove(session);
                          // index--;
                        },
                        onSwipeRight: () {
                          // session.accepted = true;
                          // requestedSessions.remove(session);
                          // index--;
                          // upcomingSessions.add(session);
                          // print(upcomingSessions);
                        },
                      );
                    },
                    itemCount: requestedSessions.length), //requested item
                ListView.builder(
                    itemBuilder: (_, index) {
                      return SessionListItem(session: completedSessions[index]);
                    },
                    itemCount: completedSessions.length),
                ListView.builder(
                    itemBuilder: (_, index) {
                      return SessionListItem(session: rejectedSessions[index]);
                    },
                    itemCount: rejectedSessions.length),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
