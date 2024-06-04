import 'dart:convert';

import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Models/Producto.dart';
import 'package:http/http.dart' as http;

class ProductosService {
  final String endpoint = "https://codedelka.pythonanywhere.com/api/";
  final prefs = PrefernciaUsuario();
  Future<List<Producto>>? getProductoByCategory(String id, String token) async {
    int  idUsuario = 0;
    idUsuario = prefs.id;
    try {
      final url = "$endpoint/getProductosPorCategoria";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'idCategoria': id, 'idUsuario': idUsuario}),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        final List<Producto> productos =
            jsonData.map((data) => Producto.fromMap(data)).toList();
        return productos;
      } else {
        throw Exception("Error al obtener productos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error al obtener productos: $e");
    }
  }

  Future<String> saveProducto(Producto p, String token) async {
    try {
      final url = "$endpoint/addProducto";
      int idUsuario = 0;
      idUsuario = prefs.id;
      p.idUsuario = idUsuario as int? ;

      final response = await http.post(
        Uri.parse(url),
        body: p.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return "Producto Guardado";
      } else {
        throw Exception("Error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }

  Future<List<Producto>>? getProductos(String token) async {
    try {
      final url = "$endpoint/getProductos";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        final List<Producto> productos =
            jsonData.map((data) => Producto.fromMap(data)).toList();
        return productos;
      } else {
        throw Exception("Error al obtener productos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error al obtener productos: $e");
    }
  }
}
