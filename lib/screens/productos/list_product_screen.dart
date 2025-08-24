import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/tarjetaproducto_widget.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final product = [
      'Producto 1',
      'Producto 2',
      'Producto 3',
      'Producto 4',
      'Producto 5',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_product');
          },
          child: TarjetaProducto(
            imagenUrl: 'imagenProductoServicio',
            nombre: 'nombreProductoSevicio',
            sku: 'skuProductoServicio',
            precio: 000, //precio de producto servicio
          ), //informacion de producto
        ),
      ),
    );
  }
}
