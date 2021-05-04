import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careyaya/models/ui/menu_option.model.dart';

class SegmentedSelector extends StatelessWidget {
  const SegmentedSelector(
      {this.menuOptions, this.selectedOption, this.onValueChanged});

  final List<MenuOptionsModel> menuOptions;
  final String selectedOption;
  final void Function(String) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
        groupValue: selectedOption,
        children: {
          for (var option in menuOptions)
            option.key: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(option.icon),
                const SizedBox(width: 6),
                Text(option.value),
              ],
            )
        },
        onValueChanged: onValueChanged);
  }
}
