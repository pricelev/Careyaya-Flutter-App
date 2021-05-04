import 'package:animate_do/animate_do.dart';
import 'package:careyaya/config/routes.dart';
import 'package:careyaya/widgets/forms/fields/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int delayedAmount = 0;
    // const double _scale = 1;
    const color = Colors.white;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            heightFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInDown(
                  delay: const Duration(milliseconds: delayedAmount + 300),
                  child: const Text(
                    "Welcome to \n CareYaya",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: delayedAmount + 600),
                  child: const Text(
                    "Your personal",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: delayedAmount + 600),
                  child: const Text(
                    "Care Management Platform",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: delayedAmount + 900),
                  child: Button(
                    text: 'Sign In',
                    onTap: _onTapLogin,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                // FadeInDown(
                //   child: GestureDetector(
                //     onTap: _onTapNoAccount,
                //     child: Text(
                //       "I Don't have An Account".toUpperCase(),
                //       style: TextStyle(
                //           fontSize: 20.0,
                //           fontWeight: FontWeight.bold,
                //           color: color),
                //     ),
                //   ),
                //   delay: Duration(milliseconds: delayedAmount + 5000),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onTapLogin() {
  Get.offAllNamed(LOGIN_ROUTE);
}
