import 'package:animate_do/animate_do.dart';
import 'package:careyaya/ui/screens/auth/login.screen.dart';
import 'package:careyaya/ui/widgets/forms/fields/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int delayedAmount = 300;
    final color = Colors.white;
    final double _scale = 1;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          child: Center(
            heightFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInDown(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                    textAlign: TextAlign.center,
                  ),
                  delay: Duration(milliseconds: delayedAmount),
                ),
                SizedBox(
                  height: 100.0,
                ),
                FadeInDown(
                  child: GestureDetector(
                    onTap: _onTapRegister,
                    child: Transform.scale(
                      scale: _scale,
                      child: Button(
                        text: 'Register',
                      ),
                    ),
                  ),
                  delay: Duration(milliseconds: delayedAmount + 200),
                ),
                SizedBox(
                  height: 50.0,
                ),
                FadeInDown(
                  child: GestureDetector(
                    onTap: _onTapHasAccount,
                    child: Text(
                      "I Already have An Account".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ),
                  delay: Duration(milliseconds: delayedAmount + 400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onTapHasAccount() {
  Get.offAll(LoginScreen());
}

void _onTapRegister() {
  // Handle registration values
}
