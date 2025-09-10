import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit(this._firebaseAuthrepo) : super(SignOutInitial());

  final FirebaseAuthRepo _firebaseAuthrepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await _firebaseAuthrepo.signOut();
    result.fold(
      (failure) => emit(SignOutFailure(errMessage: failure.errMessage)),
      (_) => emit(SignOutSuccess()),
    );
  }
}
