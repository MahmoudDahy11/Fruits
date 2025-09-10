part of 'put_product_cubit.dart';

sealed class PutProductState extends Equatable {
  const PutProductState();

  @override
  List<Object> get props => [];
}

final class PutProductInitial extends PutProductState {}

final class PutProductLoading extends PutProductState {}

final class PutProductFailure extends PutProductState {
  final String errMessage;
  const PutProductFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class PutProductSuccess extends PutProductState {
  final ProductEntity product;
  const PutProductSuccess({required this.product});
  @override
  List<Object> get props => [product];
}
