import 'dart:convert';


import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Models/Usuario.dart';

import 'package:http/http.dart' as http;

class UsuarioServicio {
  final String endpoint = "https://codedelka.pythonanywhere.com/api/";

  Future<Usuario>? getUsuario(Usuario user) async {
    final prefs = PrefernciaUsuario();
    try {
      final url = "$endpoint/login";
      print(user.toJson());
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: user.toJson());

      //print(response.body);
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        final token = decodeData['token'];
        final id = decodeData['user_id'] as int?;
        final usuario =
            Usuario(id: id, username: user.username, password: user.password);

        prefs.token = token;
        return usuario;
      } else {
        if (response.statusCode == 401) {
          throw Exception('Usuario o Contraseña incorrecto');
        } else {
          throw Exception("Error del servidor ${response.statusCode}");
        }
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }
}
