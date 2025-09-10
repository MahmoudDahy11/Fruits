import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'patch_product_state.dart';

class PatchProductCubit extends Cubit<PatchProductState> {
  PatchProductCubit(this._productRepo) : super(PatchProductInitial());
  final ProductRepo _productRepo;
  Future<void> patchProduct({
    required String endPoint,
    required Map<String, dynamic>? body,
    String? token,
  }) async {
    emit(PatchProductLoading());
    final result = await _productRepo.patch(
      endPoint: endPoint,
      body: body,
      token: token,
    );
    result.fold(
      (failure) => emit(PatchProductFailure(errMessage: failure.errMessage)),
      (product) => emit(PatchProductSuccess(product: product)),
    );
  }
}
