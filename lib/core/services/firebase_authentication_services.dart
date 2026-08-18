import 'package:evently_app/core/services/snack_bar_service.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:evently_app/main.dart';
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
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.invalidEmailFormat);
      return false;
    }
    if (!Validations.validatePassword(password)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.wrongPasswordShort);
      return false;
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessMessage(navigatorKey.currentContext!.l10n.accountCreatedSuccessfullyAuth);
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? navigatorKey.currentContext!.l10n.passwordTooWeak);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? navigatorKey.currentContext!.l10n.emailAlreadyInUse);
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            navigatorKey.currentContext!.l10n.emailBadlyFormatted);
      } else {
        SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      }
      return false;
    } on PlatformException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(
          navigatorKey.currentContext!.l10n.unexpectedPlatformError(e.message ?? ""));
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      return false;
    }
  }

  static Future<bool> login(
      {required String email, required String password}) async {
    EasyLoading.show();

    if (!Validations.validateEmail(email)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.invalidEmailFormat);
      return false;
    }
    if (!Validations.validatePassword(password)) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.wrongPasswordShort);
      return false;
    }
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SnackBarService.showSuccessMessage(navigatorKey.currentContext!.l10n.loggedInSuccessfully);
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? navigatorKey.currentContext!.l10n.noUserFoundForEmail);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? navigatorKey.currentContext!.l10n.wrongPasswordForUser);
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            navigatorKey.currentContext!.l10n.emailBadlyFormatted);
      } else {
        SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      }
      return false;
    } on PlatformException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(
          navigatorKey.currentContext!.l10n.unexpectedPlatformError(e.message ?? ""));
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      return false;
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      SnackBarService.showSuccessMessage(navigatorKey.currentContext!.l10n.loggedOutSuccessfully);
    } catch (e) {
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.errorWhileLoggingOut);
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
        SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.googleSignInCancelled);
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
      SnackBarService.showSuccessMessage(navigatorKey.currentContext!.l10n.signedInWithGoogleSuccessfully);
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(e.message ?? navigatorKey.currentContext!.l10n.googleSignInFailed);
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
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
        SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.noUserFoundForEmail);
      } else if (e.code == 'invalid-email') {
        SnackBarService.showErrorMessage(
            navigatorKey.currentContext!.l10n.emailBadlyFormatted);
      } else {
        SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage(navigatorKey.currentContext!.l10n.unexpectedErrorOccurred);
      return false;
    }
  }
}
