import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careyaya/constants/routes.dart';

class SessionListScreen extends StatelessWidget {
  List<SessionModel> sessions = ExampleSessions().generateSessions();
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
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width:.5))
                    ),
                    child:TabBarView(
                      children:[
                        Container(
                          child:
                            Text('coming soon')
                        ),
                        Column( children: [
                          Expanded(child: ListView.builder(
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
                                  key: Key(session.joygiverId),
                                  child: Card(child:
                                  ListTile(
                                    leading: Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
                                    title: Text('${session.hoursCount} hours with ${session.lovedOneId}'),
                                    onTap: _onTap,
                                  )),
                                );
                              },
                              itemCount: sessions.length)),
                        ]),
                        Container(
                            child:
                            Text('coming soon')
                        ),
                        Container(
                            child:
                            Text('coming soon')
                        ),
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
