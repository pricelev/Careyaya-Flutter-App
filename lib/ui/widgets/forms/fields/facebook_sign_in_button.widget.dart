import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      elevation: 0,
      key: ValueKey("Facebook"),
      text: 'Continue with Facebook',
      icon: FontAwesomeIcons.facebookF,
      image: ClipRRect(
        child: Image(
          image: AssetImage(
            'assets/logos/facebook_new.png',
            package: 'flutter_signin_button',
          ),
          height: 35.0,
        ),
      ),
      backgroundColor: Color(0xFF1877f2),
      innerPadding: EdgeInsets.fromLTRB(12, 0, 11, 0),
      onPressed: _handleSignInWithFacebook,
      padding: EdgeInsets.all(5),
      height: 80,
      fontSize: 20,
      width: double.infinity,
      // shape: shape,
    );
  }
}

void _handleSignInWithFacebook() async {}
