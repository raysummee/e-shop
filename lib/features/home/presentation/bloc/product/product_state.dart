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
  final bool isDiscountAvail;
  const ProductLoaded({
    required this.products,
    required this.isDiscountAvail
  });

  @override
  List<Object> get props => [products, isDiscountAvail];
}
