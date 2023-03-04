// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterUserDto {
  final String name;
  final String email;
  final String password;
  const RegisterUserDto({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterUserDto.fromMap(Map<String, dynamic> map) {
    return RegisterUserDto(
      name: (map["name"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserDto.fromJson(String source) => RegisterUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  RegisterUserDto copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterUserDto(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
