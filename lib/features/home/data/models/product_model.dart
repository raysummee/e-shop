import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String desc;
  final int price;
  final int discountedPrice;
  final int discountPercentage;
  final String thumbnail;
  
  const ProductModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.thumbnail,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      desc,
      price,
      discountPercentage,
      thumbnail,
      discountedPrice
    ];
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, desc: $desc, price: $price, discountedPrice: $discountedPrice, discountPercentage: $discountPercentage, thumbnail: $thumbnail)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': desc});
    result.addAll({'price': price});
    result.addAll({'discountedPrice': discountedPrice});
    result.addAll({'discountPercentage': discountPercentage});
    result.addAll({'thumbnail': thumbnail});
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    int price = map['price']?.toInt() ?? 0;
    int discountedPercentage = map['discountPercentage']?.toInt() ?? 0;
    int discountedPrice = (price-((price * discountedPercentage)/100)).toInt();
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      desc: map['description'] ?? '',
      price: price,
      discountedPrice: discountedPrice,
      discountPercentage: discountedPercentage,
      thumbnail: map['thumbnail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
