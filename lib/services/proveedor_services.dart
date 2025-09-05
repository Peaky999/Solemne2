import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/proveedor.dart';

class ProveedorServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> providers = [];
  bool isLoading = true;
  bool isEditCreate = true;
  Listado? selectedProvider;

  ProveedorServices() {
    loadProviders();
  }

  loadProviders() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/provider_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final providerMap = Proveedor.fromJson(response.body);
    providers = providerMap.listado;
    isLoading = false;
    notifyListeners();
  }
  Future editOrCreateProviders(Listado provider, BuildContext context) async {
    isEditCreate = true;
    notifyListeners();
    if (provider.providerId == 0) {
      await createProvider(provider, context);
    } else {
      await editProvider(provider, context);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future editProvider(Listado provider, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: provider.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final index = providers.indexWhere(
      (element) => element.providerId == provider.providerId,
    );
    providers[index] = provider;
    loadProviders();
    Navigator.of(context).pushNamed('list_provider');
    return '';
  }

  Future createProvider(Listado provider, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: provider.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    providers.add(provider);
    loadProviders();
    Navigator.of(context).pushNamed('list_provider');
    return '';
  }

  Future deleteProvider(Listado provider, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: provider.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    providers.clear();
    loadProviders();
    Navigator.of(context).pushNamed('list_provider');
    return '';
  }
}