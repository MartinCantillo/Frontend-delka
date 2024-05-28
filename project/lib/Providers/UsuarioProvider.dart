import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/Models/Usuario.dart';

class UsuarioP {


  final String endpoint = "https://codedelka.pythonanywhere.com/api/";

  Future<Usuario>? GetUsuario(Usuario user) async {
    try {
      final url = "$endpoint/login";

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: user.toJson());
      if (response.statusCode == 200) {
        //   print(response.body);
        final decodeData = jsonDecode(response.body);
        //  print(" entro a decodedata${decodeData}");
        //print(data.toJson());
        final token = decodeData['token'];
        final id = decodeData['user_id'] as int?;
        final usuario =
            Usuario(id: id, username: user.username, password: user.password);

        return usuario;
      } else {
        throw Exception("ocurrio algo ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }
}
