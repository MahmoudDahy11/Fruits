import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw (CustomExcption(
          errMessage: 'The password provided is too weak.',
        ));
      } else if (e.code == 'email-already-in-use') {
        throw (CustomExcption(
          errMessage: 'The account already exists for that email.',
        ));
      } else {
        throw (CustomExcption(errMessage: 'FirebaseAuth error'));
      }
    } catch (e) {
      throw (CustomExcption(errMessage: 'Oops there was an erroe !!'));
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw (CustomExcption(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        throw (CustomExcption(
          errMessage: 'Wrong password provided for that user.',
        ));
      } else {
        throw (CustomExcption(errMessage: 'FirebaseAuth error'));
      }
    } catch (e) {
      throw (CustomExcption(errMessage: 'Oops there was an erroe !!'));
    }
  }
}
