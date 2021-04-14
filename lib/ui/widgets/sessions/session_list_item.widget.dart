import 'package:careyaya/constants/routes.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListItem extends StatelessWidget {
  final SessionModel session;
  final bool swipeable;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  SessionListItem(
      {@required this.session,
      this.swipeable = false,
      this.onSwipeLeft,
      this.onSwipeRight});

  void _onTap() {
    Get.toNamed(SESSION_ROUTE, arguments: {'sessionId': session.id});
  }

  @override
  Widget build(BuildContext context) {
    final listItem = Container(
      key: Key(session.joygiverId),
      child: Card(
          child: ListTile(
        leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
        title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
        onTap: _onTap,
      )),
    );

    if (!swipeable) {
      return listItem;
    }

    return Dismissible(
      key: Key(session.joygiverId),
      child: listItem,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          showAlertDialogReject(context, onSwipeLeft);
        }
        if (direction == DismissDirection.startToEnd) {
          showAlertDialogAccept(context, onSwipeRight);
        }
      },
    );
  }
}

void showAlertDialogAccept(BuildContext context, Function onConfirm) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: onConfirm,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Accept Dialog"),
    content: Text("Would you like to accept this Session?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  Get.dialog(alert);
}

void showAlertDialogReject(BuildContext context, Function onConfirm) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: onConfirm,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Decline Dialog"),
    content: Text("Would you like to reject this Session?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  Get.dialog(alert);
}
