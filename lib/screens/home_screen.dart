import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/tarjetamenu_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        title: const Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0),
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          TarjetamenuWidget(
            rutaRedireccion: 'list_provider',
            imagenUrl: 'lib/assets/proveedores.webp',
            titulo:
                'Proveedores',            
          ),
          TarjetamenuWidget(
            rutaRedireccion: 'list_category', 
            imagenUrl: 'lib/assets/categoria.webp',
            titulo:
                'Categorias',            
          ),
          TarjetamenuWidget(
            rutaRedireccion: 'list_product', 
            imagenUrl: 'lib/assets/productos.jpg',
            titulo:
                'Productos',            
          ),
        ],
      ),
    );
  }
}
