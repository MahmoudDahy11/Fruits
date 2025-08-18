import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      emit(AuthLoading());
      await _firebaseAuthentication.registerUser(
        email: email,
        password: password,
        fullName: fullName
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      await _firebaseAuthentication.loginUser(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
