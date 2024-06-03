import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Provider/UsuarioProvider.dart';
import 'package:project/Provider/ProductosProvider.dart';
import 'package:project/View/Widgets/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  final prefs = PrefernciaUsuario();
  await prefs.initPrefs();

  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => ProductosProvider()),
        
      ],
      child: const MyApp(),
    ),
  );
}
