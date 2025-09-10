import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._firebaseAuthrepo) : super(LoginInitial());

  final FirebaseAuthRepo _firebaseAuthrepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      final result = await _firebaseAuthrepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
        (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
        (user) => emit(LoginSuccess(user)),
      );
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
