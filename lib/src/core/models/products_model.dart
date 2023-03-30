import 'dart:convert';

// ideias:
// - implementar imagem de produtos
class ProductsModel {
  int id;
  String description;
  double qtd;
  double custValue;
  double saleValue;
  ProductsModel({
    required this.id,
    required this.description,
    required this.qtd,
    required this.custValue,
    required this.saleValue,
  });
  

  ProductsModel copyWith({
    int? id,
    String? description,
    double? qtd,
    double? custValue,
    double? saleValue,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      description: description ?? this.description,
      qtd: qtd ?? this.qtd,
      custValue: custValue ?? this.custValue,
      saleValue: saleValue ?? this.saleValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'qtd': qtd,
      'custValue': custValue,
      'saleValue': saleValue,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: (map["id"] ?? 0) as int,
      description: (map["description"] ?? '') as String,
      qtd: (map["qtd"] ?? 0.0) as double,
      custValue: (map["custValue"] ?? 0.0) as double,
      saleValue: (map["saleValue"] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, description: $description, qtd: $qtd, custValue: $custValue, saleValue: $saleValue)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.qtd == qtd &&
      other.custValue == custValue &&
      other.saleValue == saleValue;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      qtd.hashCode ^
      custValue.hashCode ^
      saleValue.hashCode;
  }
}
