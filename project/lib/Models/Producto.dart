import 'dart:convert';

class Producto {
  int? id;
  String? nombre;
  String? prioridad;
  String? nota;
  double? precio;
  double? adquirido;
  int? idCategoria;
  Producto({
    this.id,
    this.nombre,
    this.prioridad,
    this.nota,
    this.precio,
    this.adquirido,
    this.idCategoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'prioridad': prioridad,
      'nota': nota,
      'precio': precio,
      'adquirido': adquirido,
      'idCategoria': idCategoria,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id']?.toInt(),
      nombre: map['nombre'],
      prioridad: map['prioridad'],
      nota: map['nota'],
      precio: map['precio']?.toDouble(),
      adquirido: map['adquirido']?.toDouble(),
      idCategoria: map['idCategoria']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Producto.fromJson(String source) =>
      Producto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Producto(id: $id, nombre: $nombre, prioridad: $prioridad, nota: $nota, precio: $precio, adquirido: $adquirido, idCategoria: $idCategoria)';
  }
}
