import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce_app/core/services/api_service.dart';
import 'package:e_commerce_app/features/shopping/data/service/product_service.dart';
import 'package:e_commerce_app/features/shopping/data/service/cart_service.dart';
import 'package:e_commerce_app/features/shopping/data/service/favorite_firestore.dart';
import 'package:e_commerce_app/features/shopping/data/repo/cart_repository_implement.dart';
import 'package:e_commerce_app/features/shopping/data/repo/product_repo_implement.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/cart/cart_cubit.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:e_commerce_app/core/services/firebase_auth.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/shopping/domain/repo/product_repo.dart';
import '../../features/shopping/domain/repo/cart_repository.dart';
import '../../features/shopping/data/repo/fav_repo_implement.dart';
import '../../features/shopping/domain/repo/fav_repo.dart';
import '../../features/auth/presentation/cubits/facebook_cubit/facebook_cubit.dart';
import '../../features/auth/presentation/cubits/google_cubit/google_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/shopping/presentation/cubits/add_product/add_product_cubit.dart';
import '../../features/shopping/presentation/cubits/delete_product/delete_product_cubit.dart';
import '../../features/shopping/presentation/cubits/get_product/get_product_cubit.dart';
import '../../features/shopping/presentation/cubits/patch_product/patch_product_cubit.dart';
import '../../features/shopping/presentation/cubits/put_product/put_product_cubit.dart';
import '../../features/shopping/presentation/cubits/fav/favorite_cubit.dart';


/*
 * this file is responsible for setting up the GetIt service locator
 * it registers services, repositories, and cubits for dependency injection
 * to use, call getIt<T>() to retrieve an instance of type T
 * for example, getIt<ApiService>() returns the registered ApiService instance
 * make sure to call getItSetup() during app initialization
 */
final getIt = GetIt.instance;

Future<void> getItSetup() async {
  // services
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<ProductService>(
    () => ProductService(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CartFirestoreService>(
    () => CartFirestoreService(),
  );
  getIt.registerLazySingleton<FavoriteFirestoreService>(
    () => FavoriteFirestoreService(),
  );
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());

  // repo
  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImplement(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt<CartFirestoreService>()),
  );
  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt<FavoriteFirestoreService>()),
  );
  getIt.registerLazySingleton<FirebaseAuthRepo>(
    () => FirebaseAuthRepoImplement(getIt<FirebaseService>()),
  );

  // Cubits / Factories
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
  // CartCubit now gets CartRepository and ProductService
  getIt.registerFactory(() => CartCubit(getIt<CartRepository>()));
  getIt.registerFactory(() => FavoriteCubit(getIt()));
}
