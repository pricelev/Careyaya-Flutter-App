import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostSessionUpload extends StatefulWidget {
  @override
  _PostSessionUploadState createState() => _PostSessionUploadState();
}

class _PostSessionUploadState extends State<PostSessionUpload> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    ]);
  }
}
