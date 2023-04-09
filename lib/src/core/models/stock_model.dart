// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'products_model.dart';

class StockModel {
  int id;
  String description;
  String category;
  int? amount;
  List<ProductsModel>? products;
  StockModel({
    required this.id,
    required this.description,
    required this.category,
    this.amount,
    this.products,
  });

  StockModel copyWith({
    int? id,
    String? description,
    String? category,
    int? amount,
    List<ProductsModel>? products,
  }) {
    return StockModel(
      id: id ?? this.id,
      description: description ?? this.description,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'category': category,
      'amount': amount,
      'products': products?.map((x) {return x.toMap();}).toList(growable: false),
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: (map["id"] ?? 0) as int,
      description: (map["description"] ?? '') as String,
      category: (map["category"] ?? '') as String,
      amount: map['amount'] != null ? map["amount"] ?? 0 as int : null,
      products: map['products'] != null ? List<ProductsModel>.from(((map['products']) as List).map<ProductsModel?>((x) {return ProductsModel.fromMap((x?? Map<String,dynamic>.from({})) as Map<String,dynamic>);}),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockModel.fromJson(String source) => StockModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StockModel(id: $id, description: $description, category: $category, amount: $amount, products: $products)';
  }

  @override
  bool operator ==(covariant StockModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.category == category &&
      other.amount == amount &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      category.hashCode ^
      amount.hashCode ^
      products.hashCode;
  }
}
