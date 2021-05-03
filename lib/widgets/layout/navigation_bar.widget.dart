import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationItems {
  static final items = [
    TabItem(icon: Icons.assignment, title: 'Sessions'),
    TabItem(icon: Icons.chat, title: 'Messages'),
    TabItem(icon: Icons.settings, title: 'Settings'),
  ];
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: context.theme.appBarTheme.color,
      // color: Get.theme.appBarTheme.textTheme.,
      items: NavigationItems.items,
      initialActiveIndex: _getActiveIndex(),
      onTap: _handleAppBarTap,
    );
  }
}

int _getActiveIndex() {
  switch (Get.currentRoute) {
    case '/sessions':
      return 0;
    case '/chats':
      return 1;
    case '/settings':
      return 2;
    default:
      return 0;
  }
}

void _handleAppBarTap(int index) {
  switch (index) {
    case 0:
      Get.offAllNamed('/sessions');
      break;
    case 1:
      Get.offAllNamed('/chats');
      break;
    case 2:
      Get.offAllNamed('/settings');
      break;
    default:
      break;
  }
}
