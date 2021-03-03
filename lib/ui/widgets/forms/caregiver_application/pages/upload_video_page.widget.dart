import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {

  File _video;
  final picker = ImagePicker();

  Future getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
      } else {
        print('No video selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Center(
        child: _video == null
            ? Text('No video selected.')
            : Image.file(_video),
      ),
      FloatingActionButton(
        onPressed: getVideo,
        tooltip: 'Pick Video',
        child: Icon(Icons.add_a_photo),
      ),
    ]);
  }
}
