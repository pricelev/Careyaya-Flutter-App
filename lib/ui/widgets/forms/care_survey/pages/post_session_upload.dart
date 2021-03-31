import 'package:flutter/material.dart';
import 'dart:io';

class PostSessionUpload extends StatefulWidget {
  @override
  _PostSessionUploadState createState() => _PostSessionUploadState();
}

class _PostSessionUploadState extends State<PostSessionUpload> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      )
    ]);
  }
}
