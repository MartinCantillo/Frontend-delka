import 'dart:convert';

class Producto {
  int? id;
  String? nombre;
  String? prioridad;
  String? nota;
  double? precio;
  String? adquirido;
  int? idCategoria;
  int? idUsuario;
  Producto({
    this.id,
    this.nombre,
    this.prioridad,
    this.nota,
    this.precio,
    this.adquirido,
    this.idCategoria,
    this.idUsuario,
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
      'idUsuario': idUsuario
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id']?.toInt(),
      nombre: map['nombre'],
      prioridad: map['prioridad'],
      nota: map['nota'],
      precio: map['precio']?.toDouble(),
      adquirido: map['adquirido'] ?? "",
      idCategoria: map['idCategoria']?.toInt(),
      idUsuario: map['idUsuario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Producto.fromJson(String source) =>
      Producto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Producto(id: $id, nombre: $nombre, prioridad: $prioridad, nota: $nota, precio: $precio, adquirido: $adquirido, idCategoria: $idCategoria, idUsuario: $idUsuario)';
  }
}
