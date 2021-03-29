import 'package:flutter/material.dart';

class CheckField extends StatefulWidget {
  final String titleText;

  const CheckField({Key key, this.titleText}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState(titleText);
}

class _CheckBoxState extends State<CheckField> {
  bool _checked = false;
  String titleText = '';

  _CheckBoxState(this.titleText);

  void _toggleChecked() {
    setState(() {
      if (_checked) {
        _checked = false;
      } else {
        _checked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CheckboxListTile(
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = value;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.titleText),
    );
  }
}
