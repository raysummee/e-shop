part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductError extends ProductState {
  final Exception err;
  const ProductError({
    required this.err,
  });
  @override
  List<Object> get props => [err];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  const ProductLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
