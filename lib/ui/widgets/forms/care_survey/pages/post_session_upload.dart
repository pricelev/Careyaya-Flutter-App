import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:careyaya/ui/widgets/forms/care_survey/widgets/imagecapture.dart';

class PostSessionUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Section'),
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
                            Text('Part 3 of 4',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                            SizedBox(height: 15),
                            ImageCapture(),
                            Text(
                                'Provide a short description of the care session with (...): ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            TextFormField(),
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
  Get.offAllNamed('/survey4');
}
