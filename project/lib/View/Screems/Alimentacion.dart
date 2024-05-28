
import 'package:flutter/material.dart';

class Alimentacion extends StatefulWidget {
  const Alimentacion({super.key});
static const String nombre = 'Alimentacion';
  @override
  State<Alimentacion> createState() => _AlimentacionState();
}

class _AlimentacionState extends State<Alimentacion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Categoria de Alimentacion")),));
  }
}

