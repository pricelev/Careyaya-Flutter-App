import 'package:careyaya/widgets/layout/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget emailField(Widget widget) {
  return GetMaterialApp(
    home: MainScreenLayout(
      body: widget,
    ),
  );
}