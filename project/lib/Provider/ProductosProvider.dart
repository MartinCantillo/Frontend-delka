import 'package:flutter/material.dart';
import 'package:project/Models/Producto.dart';
import 'package:project/Servicios/ProductosServicio.dart';


class ProductosProvider extends ChangeNotifier {
  final ProductosService _productosService = ProductosService();
  List<Producto> _productos = [];
  List<Producto> get productos => _productos;

  Future<void> getProductosByCategory(String idCategoria, String token) async {
    try {
      final List<Producto>? productos = await _productosService.getProductoByCategory(idCategoria, token);
      _productos = productos!;
      notifyListeners();
    } catch (e) {
      print("Error al obtener productos: $e");
    }
  }
}
