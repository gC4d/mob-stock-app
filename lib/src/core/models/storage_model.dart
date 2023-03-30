import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'products_model.dart';

class StorageModel {
  int id;
  String name;
  List<ProductsModel> products;
  StorageModel({
    required this.id,
    required this.name,
    required this.products,
  });

  StorageModel copyWith({
    int? id,
    String? name,
    List<ProductsModel>? products,
  }) {
    return StorageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'products': products.map((x) {return x.toMap();}).toList(growable: false),
    };
  }

  factory StorageModel.fromMap(Map<String, dynamic> map) {
    return StorageModel(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      products: List<ProductsModel>.from(((map['products'] ?? const <ProductsModel>[]) as List).map<ProductsModel>((x) {return ProductsModel.fromMap((x?? Map<String,dynamic>.from({})) as Map<String,dynamic>);}),),
    );
  }

  String toJson() => json.encode(toMap());

  factory StorageModel.fromJson(String source) => StorageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StorageModel(id: $id, name: $name, products: $products)';

  @override
  bool operator ==(covariant StorageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ products.hashCode;
}
