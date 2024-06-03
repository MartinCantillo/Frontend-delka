import 'package:flutter/material.dart';

import 'package:project/View/Screems/Alimentacion.dart';
import 'package:project/View/Screems/LoginForm.dart';
import 'package:project/View/Screems/MyHomePage.dart';
import 'package:project/View/Login/LoginPage.dart';
import 'package:project/View/Screems/Panales.dart';
import 'package:project/View/Screems/Ropa.dart';
import 'package:project/View/Screems/Seguridad.dart';
import 'package:project/View/Screems/Higiene.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'babyApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.nombre,
      routes: {
        LoginPage.nombre: (context) => LoginPage(),
        MyHomePage.nombre: (context) => MyHomePage(),
        Ropa.nombre: (context) => Ropa(),
        Panales.nombre: (context) => Panales(),
        Alimentacion.nombre: (context) => Alimentacion(),
        Higiene.nombre: (context) => Higiene(),
        Seguridad.nombre: (context) => Seguridad(),
        LoginForm.nombre: (context) => LoginForm(),
      },
    );
  }
}
