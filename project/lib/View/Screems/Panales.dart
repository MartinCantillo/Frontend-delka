import 'package:flutter/material.dart';
import 'package:project/LocalStore/sharepreference.dart';
import 'package:project/Models/Producto.dart';
import 'package:project/Provider/ProductosProvider.dart';

import 'package:provider/provider.dart';

class Panales extends StatelessWidget {
  const Panales({super.key});
  static const String nombre = 'Panales';

  @override
  Widget build(BuildContext context) {
    String token = "";
    final prefs = PrefernciaUsuario();

    token = prefs.token;
    final productosProvider = Provider.of<ProductosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Categoría de Pañales"),
      ),
      body: FutureBuilder(
        future: productosProvider.getProductosByCategory('1', token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Producto> productos = productosProvider.productos;

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
                  child: Column(
                    children: [
                      // Puedes personalizar esto según las propiedades de tu modelo de producto
                      ListTile(
                        title: Text(producto.nombre ?? ""),

                        subtitle: Text('\$${producto.precio}'),
                        // Implementa aquí la lógica para mostrar la imagen del producto
                        // Puedes usar AssetImage, NetworkImage, etc.
                      ),
                    ],
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
