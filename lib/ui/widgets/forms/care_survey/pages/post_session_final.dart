import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class PostSessionFinal extends StatelessWidget {
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
                            SizedBox(height: 40),
                            Text('Post Session Survey',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                                textAlign: TextAlign.center),
                            SizedBox(height: 5),
                            Text('Part 4 of 4',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                            SizedBox(height: 30),
                            Text('(...) level of cognition and functioning: ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            FormBuilderRating(name: 'rate'),
                            SizedBox(height: 40),
                            MaterialButton(
                              minWidth: 70,
                              height: 40,
                              child: Text('Submit'),
                              onPressed: ButtonClick,
                              color: Colors.red[900],
                            ),
                          ],
                        )))))));
  }
}

void ButtonClick() {
  Get.offAllNamed('/sessions');
}
