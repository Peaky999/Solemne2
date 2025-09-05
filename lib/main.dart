import 'package:flutter/material.dart';
import 'package:marketsmart/routes/app_routes.dart';
import 'package:marketsmart/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget{
  const AppState ({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProductoServices()),
      ChangeNotifierProvider(create: (_) => CategoriaServices()),
      ChangeNotifierProvider(create: (_) => ProveedorServices()),
      ChangeNotifierProvider(create:  (_) => AuthServices())
    ],
    child: MarketSmartApp() ,);
  }}

class MarketSmartApp extends StatelessWidget {
  const MarketSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MarketSmart',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}