import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/product_entity.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this._productRepo) : super(GetProductInitial());
  final ProductRepo _productRepo;
  Future<void> getProducts({required String endPoint, String? token}) async {
    emit(GetProductLoading());
    final result = await _productRepo.get(endPoint: endPoint, token: token);
    result.fold(
      (failure) => emit(GetProductFailure(errMessage: failure.errMessage)),
      (products) => emit(GetProductSuccess(products: products)),
    );
  }
}
