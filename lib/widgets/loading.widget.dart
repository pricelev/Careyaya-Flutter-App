import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//loading indicator code is a modified and simplified version of this code
//https://github.com/fayaz07/ots

final _tKey = GlobalKey(debugLabel: 'overlay_parent');

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        key: _tKey,
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ),
    );
  }
}
