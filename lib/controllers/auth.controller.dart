import 'dart:async';

import 'package:careyaya/constants/routes.dart';
import 'package:careyaya/localizations.dart';
import 'package:careyaya/models/user.model.dart';
import 'package:careyaya/ui/screens/auth/auth.screen.dart';
import 'package:careyaya/ui/screens/session_list.screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  AppLocalizations_Labels labels;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Streams of firebase Auth user and firestore user
  Rx<User> firebaseUser = Rx<User>();
  Rx<UserModel> firestoreUser = Rx<UserModel>();

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser;

  User get user => firebaseUser.value;

  // Firebase user a realtime stream
  Stream<User> get userStream => _auth.userChanges();

  // Get profile
  UserModel get getProfile => firestoreUser.value;

  @override
  // ignore: must_call_super
  void onReady() async {
    //run every time auth state changes
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(userStream);
    ever(firebaseUser, handleAuthChanged);
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) {
    // Get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }

    if (_firebaseUser == null) {
      Get.offAll(AuthScreen());
    } else if (UNAUTHENTICATED_ROUTES.contains(Get.currentRoute)) {
      Get.offAll(SessionListScreen());
    }
  }

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.doc('/users/${firebaseUser.value.uid}').snapshots().map(
          (snapshot) => snapshot != null
              ? UserModel.fromMap(snapshot.data(), firebaseUser.value.uid)
              : null);
    }

    return null;
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.doc('/users/${firebaseUser.value.uid}').get().then(
          (documentSnapshot) => UserModel.fromMap(
              documentSnapshot.data(), firebaseUser.value.uid));
    }
    return null;
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context,
      {@required String email, @required String password}) async {
    final labels = AppLocalizations.of(context);
    // showLoadingIndicator();
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      // hideLoadingIndicator();
    } catch (error) {
      // hideLoadingIndicator();
      Get.snackbar(labels.auth.signInErrorTitle, labels.auth.signInError,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(googleAuthCredential);
    } catch (error) {
      print(error);
    }
  }

  // User registration using email and password
  // registerWithEmailAndPassword(BuildContext context) async {
  //   final labels = AppLocalizations.of(context);
  //   showLoadingIndicator();
  //   try {
  //     await _auth
  //         .createUserWithEmailAndPassword(
  //             email: emailController.text, password: passwordController.text)
  //         .then((result) async {
  //       print('uID: ' + result.user.uid);
  //       print('email: ' + result.user.email);
  //       //get photo url from gravatar if user has one
  //       // Gravatar gravatar = Gravatar(emailController.text);
  //       // String gravatarUrl = gravatar.imageUrl(
  //       //   size: 200,
  //       //   defaultImage: GravatarImage.retro,
  //       //   rating: GravatarRating.pg,
  //       //   fileExtension: true,
  //       // );
  //       //create the new user object
  //       UserModel _newUser = UserModel(
  //         uid: result.user.uid,
  //         email: result.user.email,
  //         name: nameController.text,
  //         // photoUrl: gravatarUrl
  //       );
  //       //create the user in firestore
  //       _createUserFirestore(_newUser, result.user);
  //       emailController.clear();
  //       passwordController.clear();
  //       hideLoadingIndicator();
  //     });
  //   } catch (error) {
  //     hideLoadingIndicator();
  //     Get.snackbar(labels.auth.signUpErrorTitle, error.message,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 10),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   }
  // }

  //handles updating the user when updating profile
  // Future<void> updateUser(BuildContext context, UserModel user, String oldEmail,
  //     String password) async {
  //   final labels = AppLocalizations.of(context);
  //   try {
  //     // showLoadingIndicator();
  //     await _auth
  //         .signInWithEmailAndPassword(email: oldEmail, password: password)
  //         .then((_firebaseUser) {
  //       _firebaseUser.user
  //           .updateEmail(user.email)
  //           .then((value) => _updateUserFirestore(user, _firebaseUser.user));
  //     });
  //     // hideLoadingIndicator();
  //     Get.snackbar(labels.auth.updateUserSuccessNoticeTitle,
  //         labels.auth.updateUserSuccessNotice,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 5),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   } on PlatformException catch (error) {
  //     //List<String> errors = error.toString().split(',');
  //     // print("Error: " + errors[1]);
  //     // hideLoadingIndicator();
  //     print(error.code);
  //     String authError;
  //     switch (error.code) {
  //       case 'ERROR_WRONG_PASSWORD':
  //         authError = labels.auth.wrongPasswordNotice;
  //         break;
  //       default:
  //         authError = labels.auth.unknownError;
  //         break;
  //     }
  //     Get.snackbar(labels.auth.wrongPasswordNoticeTitle, authError,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 10),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   }
  // }

  //updates the firestore user in users collection
  // void _updateUserFirestore(UserModel user, User _firebaseUser) {
  //   _db.doc('/users/${_firebaseUser.uid}').update(user.toJson());
  //   update();
  // }

  //create the firestore user in users collection
  // void _createUserFirestore(UserModel user, User _firebaseUser) {
  //   _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
  //   update();
  // }

  //password reset email
  // Future<void> sendPasswordResetEmail(BuildContext context,
  //     {@required String email}) async {
  //   final labels = AppLocalizations.of(context);
  //   // showLoadingIndicator();
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //     // hideLoadingIndicator();
  //     Get.snackbar(
  //         labels.auth.resetPasswordNoticeTitle, labels.auth.resetPasswordNotice,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 5),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   } catch (error) {
  //     // hideLoadingIndicator();
  //     Get.snackbar(labels.auth.resetPasswordFailed, error.message,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 10),
  //         backgroundColor: Get.theme.snackBarTheme.backgroundColor,
  //         colorText: Get.theme.snackBarTheme.actionTextColor);
  //   }
  // }

  // Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
