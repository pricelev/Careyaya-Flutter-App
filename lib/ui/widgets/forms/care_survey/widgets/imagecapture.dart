import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // Active image file
  File _imageFile;

  // Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  // Remove image
  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _imageFile != null
            ? Image.file(_imageFile)
            : Container(height: 150, color: Colors.black12),
        Center(
          child: Row(
            children: <Widget>[
              FlatButton(
                  child: Icon(Icons.photo_camera),
                  onPressed: () => _pickImage(ImageSource.camera)),
              FlatButton(
                  child: Icon(Icons.photo_album),
                  onPressed: () => _pickImage(ImageSource.gallery)),
              FlatButton(onPressed: _clear, child: Icon(Icons.refresh))
            ],
          ),
        )
      ],
    );
  }
}
