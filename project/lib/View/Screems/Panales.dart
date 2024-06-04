import 'package:flutter/material.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Models/Producto.dart';
import 'package:project/Provider/ProductosProvider.dart';
import 'package:project/View/Login/LoginPage.dart';
import 'package:project/View/Screems/Alimentacion.dart';
import 'package:project/View/Screems/Higiene.dart';
import 'package:project/View/Screems/MyHomePage.dart';
import 'package:project/View/Screems/Ropa.dart';
import 'package:project/View/Screems/Seguridad.dart';

import 'package:provider/provider.dart';

class Panales extends StatefulWidget {
  const Panales({super.key});
  static const String nombre = 'Panales';

  @override
  State<Panales> createState() => _PanalesState();
}

class _PanalesState extends State<Panales> {
  late Future<List<Producto>> ProductoLis;
  final prefs = PrefernciaUsuario();
  @override
  void initState() {
    super.initState();

    final token = prefs.token;

    final productosProvider =
        Provider.of<ProductosProvider>(context, listen: false);
    ProductoLis = productosProvider.getProductosByCategory('2', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categoría de Pañales",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddProductDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text(
                'Hola,',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: Text(prefs.usuario),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 50),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.child_friendly),
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
              leading: Icon(Icons.baby_changing_station),
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
              leading: Icon(Icons.fastfood),
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
              leading: Icon(Icons.cleaning_services),
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
              leading: Icon(Icons.security),
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
                          subtitle: Text(
                            "Prioridad: ${producto.prioridad ?? 'Sin prioridad'}",
                            style: TextStyle(color: Colors.blue),
                          ),
                          leading: Icon(Icons.child_care, color: Colors.blue),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout_rounded),
                          title: const Text('Cerrar Sesion'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
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

  void _showAddProductDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nombreController = TextEditingController();
    final prioridadController = TextEditingController();
    final notaController = TextEditingController();
    final precioController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Producto'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: prioridadController,
                    decoration: InputDecoration(labelText: 'Prioridad'),
                  ),
                  TextFormField(
                    controller: notaController,
                    decoration: InputDecoration(labelText: 'Nota'),
                  ),
                  TextFormField(
                    controller: precioController,
                    decoration: InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el precio';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final producto = Producto(
                    nombre: nombreController.text,
                    prioridad: prioridadController.text,
                    nota: notaController.text,
                    idCategoria: 2,
                    adquirido: "false",
                    precio: double.parse(precioController.text),
                  );
                  final prefs = PrefernciaUsuario();
                  final token = prefs.token;

                  try {
                    await Provider.of<ProductosProvider>(context, listen: false)
                        .saveProducto(producto, token);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Panales(),
                      ),
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Error al guardar producto: $e'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cerrar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
