
import 'package:flutter/material.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Models/Producto.dart';
import 'package:project/Provider/ProductosProvider.dart';
import 'package:project/View/Screems/Alimentacion.dart';
import 'package:project/View/Screems/Panales.dart';
import 'package:project/View/Screems/Ropa.dart';
import 'package:project/View/Screems/Seguridad.dart';
import 'package:provider/provider.dart';

class Higiene extends StatefulWidget {
  const Higiene({super.key});
static const String nombre = 'Higiene';
  @override
  State<Higiene> createState() => _HigieneState();
}

class _HigieneState extends State<Higiene> {
 late Future<List<Producto>> ProductoLis;

  @override
  void initState() {
    super.initState();

    final prefs = PrefernciaUsuario();
    final token = prefs.token;

    final productosProvider =
        Provider.of<ProductosProvider>(context, listen: false);
    ProductoLis = productosProvider.getProductosByCategory('4', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categoría de Higiene",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
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
                    builder: (context) => Alimentacion(),
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
            ListTile(
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
          ],
        ),
      ),
      body: FutureBuilder(
        future: ProductoLis,
        builder: (context, AsyncSnapshot<List<Producto>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Producto> productos = snapshot.data ?? [];

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos tarjetas por fila
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final Producto producto = productos[index];
                return Card(
                  elevation: 216,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1225),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: [
                        BoxShadow(
                         color: Colors.blue.withOpacity(0.70), // S
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            producto.nombre ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            '\$${producto.precio}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                          leading:
                              Icon(Icons.child_friendly, color: Colors.blue),
                        ),
                        ListTile(
                          title: Text(
                            producto.nota ?? "",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                           subtitle: Text("Prioridad: ${producto.prioridad ?? 'Sin prioridad'}", style: TextStyle(color: Colors.blue),),
                          leading: Icon(Icons.child_care, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

