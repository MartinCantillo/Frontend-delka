import 'package:flutter/material.dart';
import 'package:project/Models/Usuario.dart';
import 'package:project/Servicios/UsuarioServicio.dart';

class UsuarioProvider extends ChangeNotifier {
  UsuarioServicio usuarioS = UsuarioServicio();
  Usuario? _usuario;
  List<Usuario> _usuarios = [];
  List<Usuario> get usuarios => _usuarios;
  Usuario? get usuario => _usuario;

  Future<void> login(String username, String password) async {
    final usuario = await usuarioS
        .getUsuario(Usuario(username: username, password: password));
    if (usuario != null) {
      _usuario = usuario;
      notifyListeners();
    } else {
      throw Exception("No se pudo iniciar sesión");
    }
  }

  Future<String> saveUsuario(Usuario usuario) async {
    try {
      final response = await usuarioS.saveUsuario(usuario);
      _usuarios.add(usuario);
      notifyListeners();
      return response;
    } catch (e) {
      throw e;
    }
  }

  void logout() {
    _usuario = null;
    notifyListeners();
  }
}
