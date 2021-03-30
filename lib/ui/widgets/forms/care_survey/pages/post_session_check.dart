import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:careyaya/ui/widgets/forms/care_survey/widgets/checkfield.dart';

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
                            child: ListView(
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
                                  '(...) experienced a change in level of assistance required by Joygiver in physical support or during activities',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) was verbally aggressive with me',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) was physically aggressive with me',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) didn’t listen to me or was noncompliant',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText: '(...) tried to leave the house.',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) experienced severe emotional distress (for example: anger outbursts, intense sadness)',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText: '(...) had difficulty swallowing',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) suddenly had difficulty eating independently',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText: '(...) fell.',
                            ),
                            SizedBox(height: 5),
                            CheckField(
                              titleText:
                                  '(...) experienced other medical issues',
                            ),
                            SizedBox(height: 5),
                            RaisedButton(
                              child: Text('Continue'),
                              onPressed: ButtonClick,
                              color: Colors.red[900],
                            ),
                          ],
                        )))))));
  }
}

void ButtonClick() {
  Get.offAllNamed('/survey3');
}
