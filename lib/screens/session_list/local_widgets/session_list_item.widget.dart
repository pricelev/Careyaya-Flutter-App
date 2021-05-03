import 'package:careyaya/config/routes.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionListItem extends StatelessWidget {
  final SessionModel session;
  final bool swipeable;
  final void Function() onSwipeLeft;
  final void Function() onSwipeRight;

  const SessionListItem(
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
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          showAlertDialogReject(context, onSwipeLeft);
        }
        if (direction == DismissDirection.startToEnd) {
          showAlertDialogAccept(context, onSwipeRight);
        }
      },
      child: listItem,
    );
  }
}

void showAlertDialogAccept(BuildContext context, void Function() onConfirm) {
  // set up the buttons
  final Widget cancelButton = FlatButton(
    onPressed: () {
      Get.back();
    },
    child: const Text("Cancel"),
  );
  final Widget continueButton = FlatButton(
    onPressed: onConfirm,
    child: const Text("Continue"),
  );

  // set up the AlertDialog
  final AlertDialog alert = AlertDialog(
    title: const Text("Accept Dialog"),
    content: const Text("Would you like to accept this Session?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  Get.dialog(alert);
}

void showAlertDialogReject(BuildContext context, void Function() onConfirm) {
  // set up the buttons
  final Widget cancelButton = FlatButton(
    onPressed: () {
      Get.back();
    },
    child: const Text("Cancel"),
  );
  final Widget continueButton = FlatButton(
    onPressed: onConfirm,
    child: const Text("Continue"),
  );

  // set up the AlertDialog
  final AlertDialog alert = AlertDialog(
    title: const Text("Decline Dialog"),
    content: const Text("Would you like to reject this Session?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  Get.dialog(alert);
}
