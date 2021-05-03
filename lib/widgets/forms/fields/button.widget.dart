import 'package:careyaya/controllers/form.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Somehow I still haven't figured out how to have the form update the button.

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function() onTap;
  final bool submit;

  Button(
      {@required this.text,
      this.onTap,
      this.submit: false,
      this.color: Colors.white,
      this.textColor: const Color(0xFF8185E2)});

  @override
  Widget build(BuildContext context) {
    final basicButtonContent = Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );

    Widget submitButton() {
      FormController fc = Get.find<FormController>();
      if (fc != null && fc.isSubmitting) {
        return CircularProgressIndicator();
      } else {
        return basicButtonContent;
      }
    }

    final buttonContent = basicButtonContent;

    return GestureDetector(
      onTap: () {
        if (this.onTap != null) {
          this.onTap();
        }
        if (submit) {
          final FormController formController = Get.find<FormController>();
          formController?.submit?.call();
        }
      },
      child: Transform.scale(
        scale: 1,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: color,
          ),
          child: buttonContent,
        ),
      ),
    );
  }
}
