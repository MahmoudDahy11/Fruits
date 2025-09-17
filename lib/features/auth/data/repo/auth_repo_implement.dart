import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import '../../../../core/services/firebase_auth.dart';


/*
 * FirebaseAuthRepoImplement class
 * implements FirebaseAuthRepo interface
 * uses FirebaseService to perform authentication operations
 */
class FirebaseAuthRepoImplement extends FirebaseAuthRepo {
  final FirebaseService _firebaseService;

  FirebaseAuthRepoImplement(this._firebaseService);


 
  @override
  Future<Either<CustomFailure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await _firebaseService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      UserModel userModel = UserModel.fromFireBase(user);

      userModel = UserModel(
        uId: userModel.uId,
        email: userModel.email,
        name: name,
      );

      return right(userModel.toEntity());
    } on CustomException catch (ex) {
      return left(CustomFailure(errMessage: ex.errMessage));
    }
  }

  @override
  Future<Either<CustomFailure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel.fromFireBase(user);

      userModel = UserModel(
        uId: userModel.uId,
        email: userModel.email,
        name: userModel.name,
      );

      return right(userModel.toEntity());
    } on CustomException catch (ex) {
      return left(CustomFailure(errMessage: ex.errMessage));
    }
  }


  @override
  Future<Either<CustomFailure, Unit>> signOut() async {
    try {
      await _firebaseService.signOut();
      return right(unit);
    } on CustomException catch (ex) {
      return left(CustomFailure(errMessage: ex.errMessage));
    }
  }

  @override
  Future<Either<CustomFailure, Unit>> signInWithGoogle() async {
    try {
      await _firebaseService.signInWithGoogle();
      return right(unit);
    } on CustomException catch (ex) {
      return left(CustomFailure(errMessage: ex.errMessage));
    }
  }

  @override
  Future<Either<CustomFailure, UserEntity>> signinWithFacebook() async {
    try {
      final userCredential = await _firebaseService.signInWithFacebook();

      if (userCredential.user == null) {
        return left(
          CustomFailure(errMessage: "No user returned from Facebook login."),
        );
      }

      final UserModel userModel = UserModel.fromFireBase(userCredential.user!);

      return right(userModel.toEntity());
    } on CustomException catch (e) {
      return left(CustomFailure(errMessage: e.errMessage));
    } catch (e) {
      return left(CustomFailure(errMessage: e.toString()));
    }
  }
}
