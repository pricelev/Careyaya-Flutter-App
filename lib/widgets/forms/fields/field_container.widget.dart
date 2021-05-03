import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;
  final double paddingX;
  final double paddingY;

  FieldContainer({@required this.child, this.paddingX: 30, this.paddingY: 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
      margin: EdgeInsets.only(bottom: 25),
      child: child,
    );
  }
}
