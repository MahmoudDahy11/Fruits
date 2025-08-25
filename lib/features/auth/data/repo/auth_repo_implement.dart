import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/custom_excption.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import '../../../../core/services/firebase_auth.dart';

class AuthRepoImplement implements AuthRepo {
  @override
  AuthRepoImplement(this.firebaseAuthentication);
  final FirebaseAuthentication firebaseAuthentication;
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel.fromFireBase(user);
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      return right(userEntity);
    } on CustomExcption catch (e) {
      return left(Failure(errMessage: e.errMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      var user = await firebaseAuthentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel.fromFireBase(user);
      UserEntity userEntity = UserEntity(
        email: email,
        uId: user.uid,
        name: fullName,
      );
      return right(userEntity);
    } on CustomExcption catch (e) {
      return left(Failure(errMessage: e.errMessage));
    }
  }
}
