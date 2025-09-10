import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/product_entity.dart';

part 'put_product_state.dart';

class PutProductCubit extends Cubit<PutProductState> {
  PutProductCubit(this._productRepo) : super(PutProductInitial());
  final ProductRepo _productRepo;
  Future<void> updateProduct({
    required String endPoint,
    required Map<String, dynamic>? body,
    String? token,
  }) async {
    emit(PutProductLoading());
    final result = await _productRepo.put(
      endPoint: endPoint,
      body: body,
      token: token,
    );
    result.fold(
      (failure) => emit(PutProductFailure(errMessage: failure.errMessage)),
      (product) => emit(PutProductSuccess(product: product)),
    );
  }
}
