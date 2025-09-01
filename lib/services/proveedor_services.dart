import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marketsmart/models/proveedor.dart';

class ProveedorServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> provider = [];
  bool isLoading = true;

  ProveedorServices() {
    loadProducts();
  }

  loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/provider_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    final productMap = Proveedor.fromJson(response.body);
    provider = productMap.listado;
    isLoading = false;
    notifyListeners();
  }
}