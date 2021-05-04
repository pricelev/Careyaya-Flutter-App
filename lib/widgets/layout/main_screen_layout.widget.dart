import 'package:careyaya/widgets/layout/navigation_bar.widget.dart';
import 'package:flutter/material.dart';

class MainScreenLayout extends StatelessWidget {
  final Widget body;
  final String title;

  const MainScreenLayout({@required this.body, this.title});

  @override
  Widget build(BuildContext context) {
    final appBar = title != null
        ? AppBar(
            title: Text(title),
          )
        : null;
    return Scaffold(
      // backgroundColor: Get.theme.backgroundColor,
      appBar: appBar,
      bottomNavigationBar: NavigationBar(),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
