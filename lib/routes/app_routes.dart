import 'package:flutter/material.dart';
import 'package:marketsmart/screens/categorias/create_category_screen.dart';
import 'package:marketsmart/screens/categorias/edit_category_screen.dart';
import 'package:marketsmart/screens/categorias/list_category_screen.dart'; 
import 'package:marketsmart/screens/home_screen.dart'; 
import 'package:marketsmart/screens/error_screen.dart';
import 'package:marketsmart/screens/login_screen.dart';
import 'package:marketsmart/screens/productos/create_product_screen.dart';
import 'package:marketsmart/screens/productos/edit_product_screen.dart';
import 'package:marketsmart/screens/productos/list_product_screen.dart';
import 'package:marketsmart/screens/proveedores/create_provider_screen.dart';
import 'package:marketsmart/screens/proveedores/edit_provider_screen.dart';
import 'package:marketsmart/screens/proveedores/list_provider_screen.dart';
import 'package:marketsmart/screens/register_screen.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'error': (BuildContext context) => const ErrorScreen(),

    'create_category': (BuildContext context) => const CreateCategoryScreen(),
    'edit_category': (BuildContext context) => const EditCategoryScreen(),
    'list_category': (BuildContext context) => const ListCategoryScreen(),

    'create_product': (BuildContext context) => const CreateProductScreen(),
    'edit_product': (BuildContext context) => const EditProductScreen(),
    'list_product': (BuildContext context) => const ListProductScreen(),

    'create_provider': (BuildContext context) => const CreateProviderScreen(),
    'edit_provider': (BuildContext context) => const EditProviderScreen(),
    'list_provider': (BuildContext context) => const ListProviderScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}