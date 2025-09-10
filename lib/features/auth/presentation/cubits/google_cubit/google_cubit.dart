
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'google_state.dart';

class GoogleCubit extends Cubit<GoogleState> {
  GoogleCubit(this.firebaseAuthrepo) : super(GoogleInitial());
  final FirebaseAuthRepo firebaseAuthrepo;
  Future<void> signInWithGoogle() async {
    final result = await firebaseAuthrepo.signInWithGoogle();

    result.fold(
      (failure) => emit(GoogleFailure(errMessage: failure.errMessage)),
      (_) => emit(GoogleSuccess()),
    );
  }
}
