import 'package:flutter/material.dart';
import 'package:marketsmart/services/services.dart';
import 'package:marketsmart/widgets/widgets.dart';
import 'package:provider/provider.dart';


class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productoServices = Provider.of<ProductoServices>(context);
    //if (productoServices.isLoading = true) return LoadingScreen();
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
        itemCount: productoServices.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'edit_product');
          },
          child: TarjetaProducto(
            imagenUrl: productoServices.products[index].productImage,
            nombre: productoServices.products[index].productName,
            sku: productoServices.products[index].productId,
            precio: productoServices.products[index].productPrice
          ), //informacion de producto
        ),
      ),
    );
  }
}
