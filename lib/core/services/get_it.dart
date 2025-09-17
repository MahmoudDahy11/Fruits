import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/core/services/firebase_auth.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce_app/features/shopping/data/repo/cart_repository_implement.dart';
import 'package:e_commerce_app/features/shopping/data/repo/product_repo_implement.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/delete_product/delete_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/get_product/get_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/patch_product/patch_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/put_product/put_product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/cubits/facebook_cubit/facebook_cubit.dart';
import '../../features/auth/presentation/cubits/google_cubit/google_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/shopping/data/repo/fav_repo_implement.dart';
import '../../features/shopping/data/service/cart_service.dart';
import '../../features/shopping/data/service/favorite_firestore.dart';
import '../../features/shopping/domain/repo/cart_repository.dart';
import '../../features/shopping/domain/repo/fav_repo.dart';
import '../../features/shopping/presentation/cubits/cart/cart_cubit.dart';
import '../../features/shopping/presentation/cubits/fav/favorite_cubit.dart';

final getIt = GetIt.instance;

/*
 * getItSetup function
 * sets up dependency injection using GetIt
 * registers services, repositories, and cubits
 */
Future<void> getItSetup() async {
  // services
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<CartFirestoreService>(
    () => CartFirestoreService(),
  );
  getIt.registerLazySingleton<FavoriteFirestoreService>(
    () => FavoriteFirestoreService(),
  );

  // repo
  getIt.registerLazySingleton<FirebaseAuthRepo>(
    () => FirebaseAuthRepoImplement(getIt()),
  );
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImplement(getIt()));
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(service: getIt<CartFirestoreService>()),
  );
  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt<FavoriteFirestoreService>()),
  );

  /// Cubits
  getIt.registerFactory(() => SignupCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => SignoutCubit(getIt()));
  getIt.registerFactory(() => GoogleCubit(getIt()));
  getIt.registerFactory(() => FacebookCubit(getIt()));

  getIt.registerFactory(() => AddProductCubit(getIt()));
  getIt.registerFactory(() => DeleteProductCubit(getIt()));
  getIt.registerFactory(() => GetProductCubit(getIt()));
  getIt.registerFactory(() => PutProductCubit(getIt()));
  getIt.registerFactory(() => PatchProductCubit(getIt()));
  getIt.registerFactory(() => CartCubit(getIt()));

  getIt.registerFactory(() => FavoriteCubit(getIt()));
}
