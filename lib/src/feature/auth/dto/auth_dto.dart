import 'dart:convert';
class AuthDto {
  String email;
  String password;
  AuthDto({
    required this.email,
    required this.password,
  });

  AuthDto copyWith({
    String? email,
    String? password,
  }) {
    return AuthDto(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AuthDto.fromMap(Map<String, dynamic> map) {
    return AuthDto(
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthDto.fromJson(String source) => AuthDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthDto(email: $email, password: $password)';

  @override
  bool operator ==(covariant AuthDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
