import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/screens/session_list/local_widgets/session_list_item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListTabs extends StatelessWidget {
  final List<SessionModel> sessions;

  const SessionListTabs({@required this.sessions});

  @override
  Widget build(BuildContext context) {
    // List<SessionModel> notCanceledRejectedSession = sessions
    //     .where((session) => !session.canceled && !session.rejected)
    //     .toList();

    final List<SessionModel> requestedSessions = sessions
        .where((session) => !session.canceled && !session.rejected)
        .where((session) => !session.accepted)
        .toList();
    final List<SessionModel> upcomingSessions = sessions
        .where((session) => !session.canceled && !session.rejected)
        .where((session) => session.accepted && !session.completed)
        .toList();
    final List<SessionModel> completedSessions = sessions
        .where((session) => !session.canceled && !session.rejected)
        .where((session) => session.completed)
        .toList();
    final List<SessionModel> rejectedSessions =
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
              const Tab(text: 'Upcoming'),
              const Tab(text: 'Requested'),
              const Tab(text: 'Past'),
              const Tab(text: 'Declined'),
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
                        session: session,
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
