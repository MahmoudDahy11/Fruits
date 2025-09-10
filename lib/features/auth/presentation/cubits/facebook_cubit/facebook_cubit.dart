import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entity/user_entity.dart';

part 'facebook_state.dart';

class FacebookCubit extends Cubit<FacebookState> {
  final FirebaseAuthRepo authRepo;
  FacebookCubit(this.authRepo) : super(FacebookInitial());

  Future<void> signInWithFacebook() async {
    emit(FacebookLoading());
    final Either<CustomFailure, UserEntity> result =
        await authRepo.signinWithFacebook();

    result.fold(
      (failure) => emit(FacebookFailure(errMessage: failure.errMessage)),
      (user) => emit(FacebookSuccess(user: user)),
    );
  }
}
