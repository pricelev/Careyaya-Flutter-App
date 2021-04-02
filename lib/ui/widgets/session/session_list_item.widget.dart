import 'package:careyaya/constants/routes.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListItem extends StatelessWidget {
  final SessionModel session;

  SessionListItem({@required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(session.joygiverId),
      child: Card(
          child: ListTile(
        leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
        title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
        onTap: () => _onTap(session.id),
      )),
    );
  }
}

void _onTap(String sessionId) {
  Get.toNamed(SESSION_ROUTE, arguments: {'sessionId': sessionId});
}
