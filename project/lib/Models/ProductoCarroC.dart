import 'dart:convert';


class ProductoCarroC {
  int? id;
  int? idProducto;
  int? idCarroCompra;
  ProductoCarroC({
    this.id,
    this.idProducto,
    this.idCarroCompra,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idProducto': idProducto,
      'idCarroCompra': idCarroCompra,
    };
  }

  factory ProductoCarroC.fromMap(Map<String, dynamic> map) {
    return ProductoCarroC(
      id: map['id']?.toInt(),
      idProducto: map['idProducto']?.toInt(),
      idCarroCompra: map['idCarroCompra']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductoCarroC.fromJson(String source) =>
      ProductoCarroC.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductoCarroC(id: $id, idProducto: $idProducto, idCarroCompra: $idCarroCompra)';
}
