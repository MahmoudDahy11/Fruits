import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
 * FirebaseService class
 * handles Firebase Authentication and Firestore operations
 * includes methods for email/password, Google, and Facebook authentication
 */
class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;
      if (user == null) {
        throw CustomException(errMessage: 'User creation failed.');
      }

      await user.updateDisplayName(name);
      await user.reload();
      log("✅ User created: ${user.email}");
      await user.sendEmailVerification();
      log("📩 Verification email sent to: ${user.email}");
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw CustomException(
            errMessage: 'The password provided is too weak.',
          );
        case 'email-already-in-use':
          throw CustomException(
            errMessage: 'The account already exists for that email.',
          );
        case 'invalid-email':
          throw CustomException(errMessage: 'The email address is invalid.');
        case 'operation-not-allowed':
          throw CustomException(
            errMessage: 'Email/Password accounts are not enabled.',
          );
        default:
          throw CustomException(
            errMessage: e.message ?? 'Unknown FirebaseAuth error.',
          );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw CustomException(errMessage: 'Sign in failed. Please try again.');
      }

      await user.reload();

      if (!user.emailVerified) {
        throw CustomException(
          errMessage: 'Please verify your email before logging in.',
        );
      }
      await firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw CustomException(errMessage: 'The email address is invalid.');
        case 'user-disabled':
          throw CustomException(
            errMessage: 'This user account has been disabled.',
          );
        case 'user-not-found':
          throw CustomException(errMessage: 'No user found for that email.');
        case 'wrong-password':
          throw CustomException(errMessage: 'Wrong password provided.');
        default:
          throw CustomException(
            errMessage: e.message ?? 'Unknown FirebaseAuth error.',
          );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
    } catch (e) {
      throw CustomException(errMessage: 'Sign out failed: ${e.toString()}');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw CustomException(errMessage: "Google sign-in was cancelled.");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user == null) {
        throw CustomException(
          errMessage: "Google sign-in failed. No user returned.",
        );
      }

      await firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName ?? '',
        'photoUrl': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return user;
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        errMessage: e.message ?? "FirebaseAuth Google error.",
      );
    } catch (e) {
      throw CustomException(errMessage: "Google sign-in failed: $e");
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      log("Facebook login status: ${result.status}");
      log("Facebook login message: ${result.message}");
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else if (result.status == LoginStatus.cancelled) {
        throw CustomException(errMessage: 'Facebook sign-in was cancelled.');
      } else {
        throw CustomException(
          errMessage: result.message ?? 'Unknown Facebook login error.',
        );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }
}
