import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      emit(AuthLoading());
      await authRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: fullName,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      emit(AuthLoading());
      await authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
        fullName: fullName,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
