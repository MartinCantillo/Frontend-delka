
import 'package:flutter/material.dart';

class Panales extends StatefulWidget {
  const Panales({super.key});
static const String nombre = 'Panales';
  @override
  State<Panales> createState() => _PanaleslesState();
}

class _PanaleslesState extends State<Panales> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Categoria de Pañales")),));
  }
}