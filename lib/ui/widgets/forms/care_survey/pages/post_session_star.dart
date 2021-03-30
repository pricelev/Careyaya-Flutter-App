import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class PostSessionStar extends StatelessWidget {
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
                            Text('Part 1 of 4',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                            SizedBox(height: 15),
                            Text('Rate each field from 1 to 5 stars',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            SizedBox(height: 10),
                            Text('(...) level of cognition and functioning: ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            FormBuilderRating(name: 'rate'),
                            Text('(...) level of physical functioning: ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            FormBuilderRating(name: 'rate'),
                            Text('(...) overall mood was: ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            FormBuilderRating(name: 'rate'),
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
  Get.offAllNamed('/survey2');
}
