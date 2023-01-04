import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/features/home/data/models/product_model.dart';
import 'package:eshop/features/home/domain/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repository) : super(ProductInitial());
  final ProductRepository _repository;

  getAllProducts() async {
    emit(ProductLoading());
    try{
      var products = await _repository.getAllProducts();
      emit(ProductLoaded(products: products));
    } on Exception catch(err){
      emit(ProductError(err: err));
    }
  }
}
