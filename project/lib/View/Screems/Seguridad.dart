
import 'package:flutter/material.dart';

class Seguridad extends StatefulWidget {
  const Seguridad({super.key});
static const String nombre = 'Seguridad';
  @override
  State<Seguridad> createState() => _SeguridadState();
}

class _SeguridadState extends State<Seguridad> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Categoria de Seguridad")),));
  }
}