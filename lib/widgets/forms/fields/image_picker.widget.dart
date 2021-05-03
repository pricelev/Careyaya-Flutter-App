import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  FormFieldState<File> field;
  Rx<File> _image = Rx<File>(null);
  final imagePicker = ImagePicker();

  ImagePickerController({@required this.field});

  @override
  void onInit() {
    ever(_image, (File image) {
      field.didChange(image);
    });
    super.onInit();
  }

  // Camera
  _takePhoto() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
      update();
    }
  }

  // Gallery
  _openGallery() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
      update();
    }
  }
}

class ImagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      builder: (FormFieldState<File> field) {
        return GetBuilder(
          init: ImagePickerController(
            field: field,
          ),
          builder: (ImagePickerController imagePickerController) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: imagePickerController._image.value == null
                        ? null
                        : FileImage(imagePickerController._image.value),
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
      },
      name: 'profilePic',
    );
  }
}
