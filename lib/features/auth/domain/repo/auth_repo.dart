import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';

abstract class FirebaseAuthRepo {
  Future<Either<CustomFailure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<CustomFailure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<CustomFailure, Unit>> signOut();
  Future<Either<CustomFailure, Unit>> signInWithGoogle();
  Future<Either<CustomFailure, UserEntity>> signinWithFacebook();
}
