import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/core/config/remote_config.dart';
import 'package:eshop/features/home/data/models/product_model.dart';
import 'package:eshop/features/home/domain/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repository, this._remoteConfig) : super(ProductInitial());
  final ProductRepository _repository;
  final RemoteConfig _remoteConfig;

  getAllProducts() async {
    emit(ProductLoading());
    try{
      var products = await _repository.getAllProducts();
      emit(ProductLoaded(products: products, isDiscountAvail: _remoteConfig.isDiscountAvail()));
    } on Exception catch(err){
      emit(ProductError(err: err));
    }
  }
}
