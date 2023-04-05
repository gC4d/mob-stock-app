import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddStockDto {
  String description;
  int? userId;
  int? category;
  AddStockDto({
    required this.description,
    required this.userId,
    required this.category,
  });

  AddStockDto copyWith({
    String? description,
    int? userId,
    int? category,
  }) {
    return AddStockDto(
      description: description ?? this.description,
      userId: userId ?? this.userId,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'userId': userId,
      'category': category,
    };
  }

  factory AddStockDto.fromMap(Map<String, dynamic> map) {
    return AddStockDto(
      description: (map["description"] ?? '') as String,
      userId: (map["userId"] ?? 0) as int,
      category: map['category'] != null ? map["category"] ?? 0 as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStockDto.fromJson(String source) => AddStockDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddStockDto(description: $description, userId: $userId, category: $category)';

  @override
  bool operator ==(covariant AddStockDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.userId == userId &&
      other.category == category;
  }

  @override
  int get hashCode => description.hashCode ^ userId.hashCode ^ category.hashCode;
}
