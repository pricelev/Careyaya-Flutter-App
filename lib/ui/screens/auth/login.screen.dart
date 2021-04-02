import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/ui/screens/auth/register.screen.dart';
import 'package:careyaya/ui/widgets/forms/email_login_form.widget.dart';
import 'package:careyaya/ui/widgets/forms/fields/google_sign_in_button.widget.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginScreenController extends GetxController {
  bool emailFormOpen = false;

  @override
  void onInit() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (linkData) async {
        if (linkData?.link != null) {
          return await AuthController.to
              .signInWithEmailLink(linkData.link.toString());
        }
      },
      onError: (error) {
        print(error);
        return;
      },
    );
    print(data);

    if (deepLink != null) {
      await AuthController.to.signInWithEmailLink(deepLink.toString());
    }
    super.onInit();
  }

  void openEmailForm() {
    emailFormOpen = true;
  }

  void closeEmailForm() {
    emailFormOpen = false;
  }
}

class LoginScreen extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: color),
                  textAlign: TextAlign.center,
                ),
              ),
              // FadeInDown(
              //   child: Text(
              //     "Login",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 35.0,
              //         color: color),
              //     textAlign: TextAlign.center,
              //   ),
              //   delay: Duration(milliseconds: delayedAmount),
              // ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: GoogleSignInButton(),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   child: FacebookSignInButton(),
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: GetBuilder<LoginScreenController>(
                  init: Get.put<LoginScreenController>(LoginScreenController()),
                  builder: (loginScreenController) {
                    if (loginScreenController.emailFormOpen) {
                      return Column(
                        children: [
                          EmailLoginForm(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: GestureDetector(
                              onTap: _onTapNoAccount,
                              child: Text(
                                "I Don't have An Account",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: color),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        loginScreenController.openEmailForm();
                        loginScreenController.update();
                      },
                      child: Text(
                        "Continue with Email",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    );
                  },
                ),
              ),

              // FadeInDown(
              //   child: EmailLoginForm(),
              //   delay: Duration(milliseconds: delayedAmount + 200),
              // ),

              // SizedBox(
              //   height: 50.0,
              // ),
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
              //   delay: Duration(milliseconds: delayedAmount + 400),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

void _onTapNoAccount() {
  Get.offAll(RegisterScreen());
}
