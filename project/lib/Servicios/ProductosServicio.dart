import 'dart:convert';

import 'package:project/Models/Producto.dart';
import 'package:http/http.dart' as http;

class ProductosService {
  final String endpoint = "https://codedelka.pythonanywhere.com/api/";

  Future<List<Producto>>? getProductoByCategory(String id, String token) async {
    print('token$token');
    try {
      final url = "$endpoint/getProductosPorCategoria";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'idCategoria': id}),
      );
      if (response.statusCode== 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
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
