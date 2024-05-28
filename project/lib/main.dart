import 'package:flutter/material.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/View/Widgets/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PrefernciaUsuario();
  await prefs.initPrefs();
  runApp(const MyApp());
}
