import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careyaya/constants/routes.dart';
import 'package:intl/intl.dart';


class SessionListScreen extends StatelessWidget {

  List<SessionModel> sessions = ExampleSessions().generateSessions();


  List<SessionModel> notCanceledRejectedSession = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).toList();

  List<SessionModel> requestedSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => !session.accepted).toList();
  List<SessionModel> upcomingSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => session.accepted &&!session.completed).toList();
  List<SessionModel> completedSessions = ExampleSessions().generateSessions().where((session) => !session.canceled && !session.rejected).where((session) => session.completed).toList();
  List<SessionModel> rejectedSessions = ExampleSessions().generateSessions().where((session) => session.rejected).toList();




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
                                    leading: Text( '${DateFormat('hh:mm aa').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          session.startTimestamp.millisecondsSinceEpoch),
                                    )} -\n${DateFormat('hh:mm aa').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          session.endTimestamp.millisecondsSinceEpoch),
                                    )}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    ),
                                    title: Text(
                                      '${DateFormat('E, MMM d').format(DateTime.fromMillisecondsSinceEpoch(
                                        session.endTimestamp.millisecondsSinceEpoch))}'
                                      ,
                                      style: TextStyle(
                                        fontSize: 13,
                                      )
                                    ),
                                    trailing: Text(
                                      '${session.lovedOneId}',
                                        style: TextStyle(
                                      color: Colors.black,
                                    ))
                                    ,
                                    onTap: _onTap,
                                  )),
                                ); //upcomingsessions
                              },
                              itemCount: upcomingSessions.length)),
                        ]),
                        Column( children: [
                          Expanded(child: ListView.builder(
                              itemBuilder: (_, index) {
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
                                print(index);
                                final session = requestedSessions[index];

                                return Container(
                                  key: Key(session.joygiverId),
                                  child: Dismissible(
                                      key: Key(session.joygiverId),
                                      child: Card(child:
                                      ListTile(
                                        leading: Text( '${DateFormat('hh:mm aa').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              session.startTimestamp.millisecondsSinceEpoch),
                                        )} -\n${DateFormat('hh:mm aa').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              session.endTimestamp.millisecondsSinceEpoch),
                                        )}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        title: Text(
                                            '${DateFormat('E, MMM d').format(DateTime.fromMillisecondsSinceEpoch(
                                                session.endTimestamp.millisecondsSinceEpoch))}'
                                            ,
                                            style: TextStyle(
                                              fontSize: 13,
                                            )
                                        ),
                                        trailing: Text(
                                            '${session.lovedOneId}',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ))
                                        ,
                                        onTap: _onTap,
                                      )),
                                      onDismissed: (direction){
                                        print(direction);
                                        if(direction == DismissDirection.endToStart){
                                          showAlertDialogDecline(context);

                                            session.rejected = true;
                                            requestedSessions.remove(session);
                                            index --;


                                        }
                                        if(direction == DismissDirection.startToEnd){
                                          showAlertDialogAccept(context);
                                          print('right');
                                          session.accepted = true;
                                          requestedSessions.remove(session);
                                          index--;
                                          upcomingSessions.add(session);
                                          print(upcomingSessions);
                                        }
                                      }
                                  ),
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
                                print(  rejectedSessions.length);
                                final hasBorderBottom =
                                    index == rejectedSessions.length - 1;
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
                                final session = rejectedSessions[index];
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
                              itemCount: rejectedSessions.length)),
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

showAlertDialogAccept(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Accept Dialog"),
    content: Text("Would you like to Accept this Meeting?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogDecline(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Decline Dialog"),
    content: Text("Would you like to Decline this Meeting?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// ignore: camel_case_types

