import 'package:e_commerce_app/core/services/firebase_auth.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubits/facebook_cubit/facebook_cubit.dart';
import '../../features/auth/presentation/cubits/google_cubit/google_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  // services
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());

  // repo
  getIt.registerLazySingleton<FirebaseAuthRepo>(
    () => FirebaseAuthRepoImplement(getIt()),
  );

  /// Cubits
  getIt.registerFactory(() => SignupCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => SignoutCubit(getIt()));
  getIt.registerFactory(() => GoogleCubit(getIt()));
  getIt.registerFactory(() => FacebookCubit(getIt()));
}
