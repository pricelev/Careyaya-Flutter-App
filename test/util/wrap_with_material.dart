import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget wrapWithMaterial(Widget widget) {
  return GetMaterialApp(
    home: MainScreenLayout(
      body: widget,
    ),
  );
}
