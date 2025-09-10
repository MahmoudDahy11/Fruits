part of 'patch_product_cubit.dart';

sealed class PatchProductState extends Equatable {
  const PatchProductState();

  @override
  List<Object> get props => [];
}

final class PatchProductInitial extends PatchProductState {}

final class PatchProductLoading extends PatchProductState {}

final class PatchProductFailure extends PatchProductState {
  final String errMessage;
  const PatchProductFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class PatchProductSuccess extends PatchProductState {
  final ProductEntity product;

  const PatchProductSuccess({required this.product});
  @override
  List<Object> get props => [product];
}
