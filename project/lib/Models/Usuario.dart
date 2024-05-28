import 'dart:convert';

class Usuario {
  int? id;
  String? username;
  String? password;
  Usuario({
    this.id,
    this.username,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt(),
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() =>
      'Usuario(id: $id, username: $username, password: $password)';
}
