import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/shopping/domain/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit(this._productRepo) : super(DeleteProductInitial());
  final ProductRepo _productRepo;
  Future<void> deleteProduct({
    required String endPoint,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    emit(DeleteProductLoading());
    final result = await _productRepo.delete(
      endPoint: endPoint,
      token: token,
      body: body,
    );
    result.fold(
      (failure) => emit(DeleteProductFailure(errMessage: failure.errMessage)),
      (_) => emit(DeleteProductSuccess()),
    );
  }
}
