import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  File _image;
  final imagePicker = ImagePicker();

  // Camera
  _takePhoto() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  // Gallery
  _openGallery() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }
}

class ImagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ImagePickerController(),
      builder: (ImagePickerController imagePickerController) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: imagePickerController._image == null
                    ? null
                    : FileImage(imagePickerController._image),
                backgroundColor: Colors.grey,
              ),
              RaisedButton(
                onPressed: imagePickerController._takePhoto,
                child: Text("takePhoto"),
              ),
              RaisedButton(
                onPressed: imagePickerController._openGallery,
                child: Text("openGallery"),
              ),
            ],
          ),
        );
      },
    );
  }
}
