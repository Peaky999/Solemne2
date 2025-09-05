import 'package:flutter/material.dart';
import 'package:marketsmart/models/productos.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              'home',
              (route) => false,
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: productoServices.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            productoServices.selectedProduct = productoServices.products[index]
                .copy();
            Navigator.pushNamed(context, 'edit_product');
          },
          child: TarjetaProducto(
            imagenUrl: productoServices.products[index].productImage,
            nombre: productoServices.products[index].productName,
            sku: productoServices.products[index].productId,
            precio: productoServices.products[index].productPrice,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productoServices.selectedProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage:
                'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
            productState: '',
          );
          Navigator.pushNamed(context, 'edit_product');
        },
      ),
    );
  }
}
