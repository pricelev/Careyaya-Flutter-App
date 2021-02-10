import 'package:animate_do/animate_do.dart';
import 'package:careyaya/ui/screens/auth/login.screen.dart';
import 'package:careyaya/ui/widgets/forms/fields/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int delayedAmount = 0;
    final color = Colors.white;
    final double _scale = 1;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            heightFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // AvatarGlow(
                //   endRadius: 90,
                //   duration: Duration(seconds: 2),
                //   glowColor: Colors.white24,
                //   repeat: true,
                //   repeatPauseDuration: Duration(seconds: 2),
                //   startDelay: Duration(seconds: 1),
                //   child: Material(
                //       elevation: 8.0,
                //       shape: CircleBorder(),
                //       child: CircleAvatar(
                //         backgroundColor: Colors.grey[100],
                //         child: FlutterLogo(
                //           size: 50.0,
                //         ),
                //         radius: 50.0,
                //       )),
                // ),
                FadeInDown(
                  child: Text(
                    "Welcome to \n CareYaya",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                    textAlign: TextAlign.center,
                  ),
                  delay: Duration(milliseconds: delayedAmount + 300),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FadeInDown(
                  child: Text(
                    "Your personal",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: Duration(milliseconds: delayedAmount + 600),
                ),
                FadeInDown(
                  child: Text(
                    "Care Management Platform",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: Duration(milliseconds: delayedAmount + 600),
                ),
                SizedBox(
                  height: 100.0,
                ),
                FadeInDown(
                  child: Button(
                    text: 'Sign In',
                    onTap: _onTapLogin,
                  ),
                  delay: Duration(milliseconds: delayedAmount + 900),
                ),
                SizedBox(
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
  Get.offAll(LoginScreen());
}

// void _onTapNoAccount() {
//   Get.offAll(RegisterScreen());
// }
