
import 'package:flutter/material.dart';

class Higiene extends StatefulWidget {
  const Higiene({super.key});
static const String nombre = 'Higiene';
  @override
  State<Higiene> createState() => _HigieneState();
}

class _HigieneState extends State<Higiene> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Categoria de Higiene")),));
  }
}