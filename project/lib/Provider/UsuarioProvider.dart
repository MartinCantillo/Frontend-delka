import 'package:flutter/material.dart';
import 'package:project/Models/Usuario.dart';
import 'package:project/Servicios/UsuarioServicio.dart';

class UsuarioProvider extends ChangeNotifier {
   UsuarioServicio usuarioS=UsuarioServicio();
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  Future<void> login(String username, String password) async {
   
    final usuario = await usuarioS.getUsuario(
        Usuario(username: username, password: password));
    if (usuario != null) {
      _usuario = usuario;
      notifyListeners();
    } else {
      throw Exception("No se pudo iniciar sesión");
    }
  }

  void logout() {
    _usuario = null;
    notifyListeners();
  }
}
