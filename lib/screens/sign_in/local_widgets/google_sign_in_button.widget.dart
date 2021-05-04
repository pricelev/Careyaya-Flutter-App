import 'package:careyaya/controllers/auth/auth.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      width: double.infinity,
      elevation: 0,
      key: ValueKey("Google"),
      text: 'Continue with Google',
      textColor: Color.fromRGBO(0, 0, 0, 0.54),
      icon: FontAwesomeIcons.google,
      image: Container(
        height: 70,
        width: 60,
        // margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            alignment: FractionalOffset.topCenter,
            image: AssetImage(
              'assets/logos/google_light.png',
              package: 'flutter_signin_button',
            ),
          ),
        ),
        // child: ClipRRect(
        //   borderRadius: BorderRadius.circular(8.0),
        //   child: Image(
        //     image: AssetImage(
        //       'assets/logos/google_light.png',
        //       package: 'flutter_signin_button',
        //     ),
        //     height: 70.0,
        //   ),
        // ),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      onPressed: _handleSignInWithGoogle,
      padding: EdgeInsets.all(5),
      innerPadding: EdgeInsets.all(0),
      // shape: shape,
      height: 80.0,
      fontSize: 20,
    );
  }
}

void _handleSignInWithGoogle() async {
  await AuthController.to.signInWithGoogle();
}
