import 'package:flutter/material.dart';
import 'package:project/View/Screems/Alimentacion.dart';
import 'package:project/View/Screems/Higiene.dart';
import 'package:project/View/Screems/Panales.dart';
import 'package:project/View/Screems/Ropa.dart';
import 'package:project/View/Screems/Seguridad.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const String nombre = 'MyHomePage';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Lista de articulos",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(children: [
          Card(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjoNk9PiETzm8B2ULHMrDLZE6__7bnqjniX7nWZm8QoQ&s",
                height: 100),
          ),
          Row(
            children: [
              Card(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_mAYw7EjK6rEpxM5JooCxV32mqzEl1juxAfmHiyg35Q&s",
                    height: 100),
              ),
            ],
          ),
          Card(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYOykzwx5BgMc2F4aMSTaHm1savF_0hXh35s6qX2uqzw&s",
                height: 100),
          ),
          Row(
            children: [
              Card(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTro4H-4xuWAwqgb-yUBePOYXreXosxguCReZboYSbvEg&s",
                    height: 100),
              ),
            ],
          ),
          Card(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjoNk9PiETzm8B2ULHMrDLZE6__7bnqjniX7nWZm8QoQ&s",
                height: 100),
          ),
        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      size: 100.5,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Categorias',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Ropa'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ropa(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Pañales'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Panales(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Alimentación'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Alimentacion(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Higiene'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Higiene(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Seguridad'),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Seguridad(),
                    ),
                  );
                 
                },
              ),
               /*     ListTile(
              title: const Text('Personalizar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Alimentacion(),
                  ),
                );
              },
            ),
         */
            ],
          ),
        ),
      ),
    );
  }
}
