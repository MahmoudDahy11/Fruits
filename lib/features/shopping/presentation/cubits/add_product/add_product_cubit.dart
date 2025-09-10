import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this._productRepo) : super(AddProductInitial());
  final ProductRepo _productRepo;
  Future<void> addProduct({
    required String endPoint,
    required Map<String, dynamic>? body,
    String? token,
  }) async {
    emit(AddProductLoading());
    final result = await _productRepo.post(
      endPoint: endPoint,
      body: body,
      token: token,
    );
    result.fold(
      (failure) => emit(AddProductFailure(errMessage: failure.errMessage)),
      (product) => emit(AddProductSuccess(product: product)),
    );
  }
}
