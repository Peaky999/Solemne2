import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marketsmart/models/productos.dart';

class ProductoServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> products = [];
  Listado? selectedProduct;
  bool isLoading = true;
  bool isEditCreate = true;

  ProductoServices() {
    loadProducts();
  }

  loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/product_list_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final productMap = Productos.fromJson(response.body);
    products = productMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProducts(Listado product, BuildContext context) async {
    isEditCreate = true;
    notifyListeners();
    if (product.productId == 0) {
      await createProduct(product, context);
    } else {
      await editProduct(product, context);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future editProduct(Listado product, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final index = products.indexWhere(
      (element) => element.productId == product.productId,
    );
    products[index] = product;
    loadProducts();
    Navigator.of(context).pushNamed('list_product');
    return '';
  }

  Future createProduct(Listado product, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    products.add(product);
    loadProducts();
    Navigator.of(context).pushNamed('list_product');
    return '';
  }

  Future deleteProduct(Listado product, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    products.clear();
    loadProducts();
    Navigator.of(context).pushNamed('list_product');
    return '';
  }
}
