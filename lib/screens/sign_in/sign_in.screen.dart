import 'package:careyaya/controllers/auth/auth.controller.dart';
import 'package:careyaya/screens/sign_in/local_widgets/email_login_form.widget.dart';
import 'package:careyaya/screens/sign_in/local_widgets/google_sign_in_button.widget.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginScreenController extends GetxController {
  bool emailFormOpen = false;

  @override
  Future<void> onInit() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (linkData) async {
        if (linkData?.link != null) {
          return AuthController.to
              .signInWithEmailLink(linkData.link.toString());
        }
      },
      onError: (error) {
        debugPrint(error.toString());
        return;
      },
    );
    debugPrint(data.toString());

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
    // const int delayedAmount = 0;
    const color = Colors.white;
    // const double _scale = 1;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: color),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GoogleSignInButton(),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   child: FacebookSignInButton(),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetBuilder<LoginScreenController>(
                  init: Get.put<LoginScreenController>(LoginScreenController()),
                  builder: (loginScreenController) {
                    if (loginScreenController.emailFormOpen) {
                      return Column(
                        children: [
                          EmailLoginForm(),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(vertical: 20),
                          //   child: GestureDetector(
                          //     onTap: _onTapNoAccount,
                          //     child: const Text(
                          //       "I Don't have An Account",
                          //       style: TextStyle(
                          //           fontSize: 20.0,
                          //           fontWeight: FontWeight.bold,
                          //           color: color),
                          //     ),
                          //   ),
                          // ),
                        ],
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        loginScreenController.openEmailForm();
                        loginScreenController.update();
                      },
                      child: const Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
