part of 'add_product_cubit.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}
final class AddProductLoading extends AddProductState {}
final class AddProductFailure extends AddProductState {
  final String errMessage;
  const AddProductFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
final class AddProductSuccess extends AddProductState {
  final ProductEntity product;
  const AddProductSuccess({required this.product});
  @override
  List<Object> get props => [product];
}
