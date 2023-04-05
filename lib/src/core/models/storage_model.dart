// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'products_model.dart';

class StorageModel {
  int id;
  String description;
  int category;
  List<ProductsModel> products;
  StorageModel({
    required this.id,
    required this.description,
    required this.category,
    required this.products,
  });

  StorageModel copyWith({
    int? id,
    String? description,
    int? category,
    List<ProductsModel>? products,
  }) {
    return StorageModel(
      id: id ?? this.id,
      description: description ?? this.description,
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'category': category,
      'products': products.map((x) {return x.toMap();}).toList(growable: false),
    };
  }

  factory StorageModel.fromMap(Map<String, dynamic> map) {
    return StorageModel(
      id: (map["id"] ?? 0) as int,
      description: (map["description"] ?? '') as String,
      category: (map["category"] ?? 0) as int,
      products: List<ProductsModel>.from(((map['products'] ?? const <ProductsModel>[]) as List).map<ProductsModel>((x) {return ProductsModel.fromMap((x?? Map<String,dynamic>.from({})) as Map<String,dynamic>);}),),
    );
  }

  String toJson() => json.encode(toMap());

  factory StorageModel.fromJson(String source) => StorageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StorageModel(id: $id, description: $description, category: $category, products: $products)';
  }

  @override
  bool operator == (covariant StorageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.category == category &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      category.hashCode ^
      products.hashCode;
  }
}
