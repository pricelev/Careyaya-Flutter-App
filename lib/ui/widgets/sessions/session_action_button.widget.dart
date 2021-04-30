import 'package:flutter/material.dart';

class SessionActionButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String label;
  final Color color;

  SessionActionButton({
    @required this.onPressed,
    @required this.icon,
    @required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: this.onPressed,
      icon: Icon(this.icon),
      label: Text(this.label),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            this.color != null ? this.color : Colors.green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
      ),
    );
  }
}
