import 'package:careyaya/constants/globals.dart';
import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/controllers/language.controller.dart';
import 'package:careyaya/controllers/theme.controller.dart';
import 'package:careyaya/localizations.dart';
import 'package:careyaya/models/menu_option.model.dart';
import 'package:careyaya/ui/widgets/forms/fields/dropdown_picker.widget.dart';
import 'package:careyaya/ui/widgets/forms/fields/segmented_selector.widget.dart';
import 'package:careyaya/ui/widgets/main_screen_layout.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
          key: "system",
          value: labels.settings.system,
          icon: Icons.brightness_4),
      MenuOptionsModel(
          key: "light",
          value: labels.settings.light,
          icon: Icons.brightness_low),
      MenuOptionsModel(
          key: "dark", value: labels.settings.dark, icon: Icons.brightness_3)
    ];
    return MainScreenLayout(
      title: labels.settings.title,
      body: ListView(children: [
        GetBuilder<LanguageController>(
          builder: (controller) => ListTile(
            title: Text(labels.settings.language),
            trailing: DropdownPicker(
              menuOptions: Globals.languageOptions,
              selectedOption: controller.currentLanguage,
              onChanged: (value) async {
                await controller.updateLanguage(value);
                Get.forceAppUpdate();
              },
            ),
          ),
        ),
        GetBuilder<ThemeController>(
          builder: (controller) => ListTile(
            title: Text(labels.settings.theme),
            trailing: SegmentedSelector(
              selectedOption: controller.currentTheme,
              menuOptions: themeOptions,
              onValueChanged: (value) async {
                await controller.setThemeMode(value);
              },
            ),
          ),
        ),
        ListTile(
          title: Text(labels.settings.signOut),
          trailing: ElevatedButton(
            onPressed: _handleLogout,
            child: Text(
              labels.settings.signOut,
            ),
            style: ElevatedButton.styleFrom(elevation: 0),
          ),
        ),
      ]),
    );
  }
}

void _handleLogout() async {
  await AuthController.to.signOut();
}
