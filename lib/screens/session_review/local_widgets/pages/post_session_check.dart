import 'package:careyaya/screens/session/local_controllers/session.controller.dart';
import 'package:careyaya/screens/session_review/local_widgets/checkfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostSessionCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Star Section'),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 400,
                width: double.maxFinite,
                child: Card(
                    elevation: 5,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                            child: GetBuilder<SessionController>(
                          init: SessionController(sessionId: 'test'),
                          builder: (SessionController sessionController) {
                            final lovedOneData =
                                sessionController.lovedOneProfile;
                            if (lovedOneData == null) {
                              return null;
                            }
                            final lovedOneFirstName =
                                lovedOneData.name.first ?? 'The loved one';
                            return ListView(
                              children: [
                                Text('Post Session Survey',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 5),
                                Text('Part 2 of 4',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 15),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName experienced a change in level of assistance required by Joygiver in physical support or during activities',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName was verbally aggressive with me',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName was physically aggressive with me',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName didn’t listen to me or was noncompliant',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName tried to leave the house.',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName experienced severe emotional distress (for example: anger outbursts, intense sadness)',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName had difficulty swallowing',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName suddenly had difficulty eating independently',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText: '$lovedOneFirstName fell.',
                                ),
                                SizedBox(height: 5),
                                CheckField(
                                  titleText:
                                      '$lovedOneFirstName experienced other medical issues',
                                ),
                                SizedBox(height: 5),
                                RaisedButton(
                                  child: Text('Continue'),
                                  onPressed: ButtonClick,
                                  color: Colors.red[900],
                                ),
                              ],
                            );
                          },
                        )))))));
  }
}

void ButtonClick() {
  Get.offAllNamed('/survey4');
}
