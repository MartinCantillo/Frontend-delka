import 'package:flutter/material.dart';
import 'package:project/Models/Producto.dart';
import 'package:project/Servicios/ProductosServicio.dart';

class ProductosProvider extends ChangeNotifier {
  final ProductosService _productosService = ProductosService();
  List<Producto> _productos = [];
  List<Producto> get productos => _productos;

  Future<List<Producto>> getProductosByCategory(
      String idCategoria, String token) async {
    try {
      final List<Producto>? productos =
          await _productosService.getProductoByCategory(idCategoria, token);
      _productos = productos!;
      notifyListeners();
      return _productos;
    } catch (e) {
      // print("Error al obtener productos: $e");
      throw e;
    }
  }

  Future<List<Producto>> getProductos(String token) async {
    try {
      final List<Producto>? productos =
          await _productosService.getProductos(token);
      _productos = productos!;
      notifyListeners();
      return _productos;
    } catch (e) {
      throw e;
    }
  }

  Future<String> saveProducto(Producto producto, String token) async {
    try {
      final response = await _productosService.saveProducto(producto, token);
      _productos.add(producto);
      notifyListeners();
      return response;
    } catch (e) {
      throw e;
    }
  }
}
