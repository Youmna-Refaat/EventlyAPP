import 'package:evently_app/core/services/snack_bar_service.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  static Future<bool> createAccount(
      {required String email, required String password}) async {
    EasyLoading.show();

    if (!Validations.validateEmail(email)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("Invalid email format");
      return false;
    }
    if (!Validations.validatePassword(password)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("Wrong password");
      return false;
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account Created Successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? "The account already exists for that email");
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            "The email address is badly formatted");
      } else {
        SnackBarService.showErrorMessage("An unexpected error occurred");
      }
      return false;
    } on PlatformException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(
          "An unexpected platform error occurred: ${e.message}");
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("An unexpected error occurred");
      return false;
    }
  }

  static Future<bool> login(
      {required String email, required String password}) async {
    EasyLoading.show();

    if (!Validations.validateEmail(email)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("Invalid email format");
      return false;
    }
    if (!Validations.validatePassword(password)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("Wrong password");
      return false;
    }
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessMessage("Logged in Successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? "No user found for that email");
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? "Wrong password provided for that user");
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            "The email address is badly formatted");
      } else {
        SnackBarService.showErrorMessage("An unexpected error occurred");
      }
      return false;
    } on PlatformException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(
          "An unexpected platform error occurred: ${e.message}");
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("An unexpected error occurred");
      return false;
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      SnackBarService.showSuccessMessage("Logged out successfully");
    } catch (e) {
      SnackBarService.showErrorMessage("An error occurred while logging out");
    }
  }

  static String currentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return '';
  }

  static Future<bool> signInWithGoogle() async {
    EasyLoading.show();

    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("Google Sign-In cancelled");
        return false;
      }
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      EasyLoading.dismiss();
      SnackBarService.showSuccessMessage("Signed in with Google successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(e.message ?? "Google Sign-In failed");
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("An unexpected error occurred");
      return false;
    }
  }

  static Future<bool> resetPassword({required String email}) async {
    EasyLoading.show();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage("No user found for that email");
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            "The email address is badly formatted");
      } else {
        SnackBarService.showErrorMessage("An unexpected error occurred");
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("An unexpected error occurred");
      return false;
    }
  }
}
