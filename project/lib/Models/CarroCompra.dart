import 'dart:convert';

class CarroCompra {
  int? id;
  String? nombre;
  int? cantidad;
  int? idProducto;
  int? idUsuario;
  double? total;
  CarroCompra({
    this.id,
    this.nombre,
    this.cantidad,
    this.idProducto,
    this.idUsuario,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'cantidad': cantidad,
      'idProducto': idProducto,
      'idUsuario': idUsuario,
      'total': total,
    };
  }

  factory CarroCompra.fromMap(Map<String, dynamic> map) {
    return CarroCompra(
      id: map['id']?.toInt(),
      nombre: map['nombre'],
      cantidad: map['cantidad']?.toInt(),
      idProducto: map['idProducto']?.toInt(),
      idUsuario: map['idUsuario']?.toInt(),
      total: map['total']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarroCompra.fromJson(String source) =>
      CarroCompra.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarroCompra(id: $id, nombre: $nombre, cantidad: $cantidad, idProducto: $idProducto, idUsuario: $idUsuario, total: $total)';
  }
}
