
import 'package:flutter/material.dart';

class Ropa extends StatefulWidget {
  const Ropa({super.key});
static const String nombre = 'ropa';
  @override
  State<Ropa> createState() => _RopaState();
}

class _RopaState extends State<Ropa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Categoria de Ropa")),));
  }
}