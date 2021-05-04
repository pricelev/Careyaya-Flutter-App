import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryScreenLayout extends StatelessWidget {
  final Widget body;
  final String title;

  SecondaryScreenLayout({@required this.body, this.title});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: this.title != null
          ? Text(
              this.title,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          : null,
      centerTitle: true,
      leading: BackButton(
        color: Colors.white,
        onPressed: () {
          Get.back();
        },
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
