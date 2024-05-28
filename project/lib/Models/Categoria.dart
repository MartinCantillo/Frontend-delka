import 'dart:convert';

class Categoria {
  int? idCategoria;
  String? nombre;
  String? descripcion;
  String? recomendacion;
  Categoria({
    this.idCategoria,
    this.nombre,
    this.descripcion,
    this.recomendacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'idCategoria': idCategoria,
      'nombre': nombre,
      'descripcion': descripcion,
      'recomendacion': recomendacion,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      idCategoria: map['idCategoria']?.toInt(),
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      recomendacion: map['recomendacion'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) =>
      Categoria.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categoria(idCategoria: $idCategoria, nombre: $nombre, descripcion: $descripcion, recomendacion: $recomendacion)';
  }
}
