import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddStockDto {
  String description;
  int? user_id;
  int? category;
  AddStockDto({
    required this.description,
    required this.user_id,
    required this.category,
  });

  AddStockDto copyWith({
    String? description,
    int? user_id,
    int? category,
  }) {
    return AddStockDto(
      description: description ?? this.description,
      user_id: user_id ?? this.user_id,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'user_id': user_id,
      'category': category,
    };
  }

  factory AddStockDto.fromMap(Map<String, dynamic> map) {
    return AddStockDto(
      description: (map["description"] ?? '') as String,
      user_id: (map["user_id"] ?? 0) as int,
      category: map['category'] != null ? map["category"] ?? 0 as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStockDto.fromJson(String source) => AddStockDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddStockDto(description: $description, user_id: $user_id, category: $category)';

  @override
  bool operator ==(covariant AddStockDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.user_id == user_id &&
      other.category == category;
  }

  @override
  int get hashCode => description.hashCode ^ user_id.hashCode ^ category.hashCode;
}
