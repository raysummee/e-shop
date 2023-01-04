import 'dart:convert';

import 'package:eshop/features/home/domain/repository/product_repository.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try{
      var res = await http.get(
        Uri.parse("https://dummyjson.com/products")
      );

      if(res.statusCode==200){
        Map<String, dynamic> data = json.decode(res.body);
        if(!data.containsKey("products")){
          throw Exception();
        }
        var products = (data['products'] as List).map((e) => ProductModel.fromMap(e)).toList();
        return products;
      }else{
        throw Exception();
      }
    }catch(err){
      debugPrint(err.toString());
      throw Exception("Cannot fetch products!!");
    }
  }
}