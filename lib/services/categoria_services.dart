import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/categorias.dart';

class CategoriaServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> categories = [];
  bool isLoading = true;
  bool isEditCreate = true;
  Listado? selectedCategory;

  CategoriaServices() {
    loadCategory();
  }

  loadCategory() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/category_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoryMap = Categorias.fromJson(response.body);
    categories = categoryMap.listado;
    isLoading = false;
    notifyListeners();
  }

Future editOrCreateCategories(Listado category, BuildContext context) async {
    isEditCreate = true;
    notifyListeners();
    if (category.categorytId == 0) {
      await createCategory(category, context);
    } else {
      await editCategory(category, context);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future editCategory(Listado category, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_edit_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final index = categories.indexWhere(
      (element) => element.categorytId == category.categorytId,
    );
    categories[index] = category;
    loadCategory();
    Navigator.of(context).pushNamed('list_category');
    return '';
  }

  Future createCategory(Listado category, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_add_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    categories.add(category);
    loadCategory();
    Navigator.of(context).pushNamed('list_category');
    return '';
  }

  Future deleteCategory(Listado category, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_del_rest/');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    categories.clear();
    loadCategory();
    Navigator.of(context).pushNamed('list_category');
    return '';
  }

}