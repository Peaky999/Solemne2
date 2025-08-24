import 'package:flutter/material.dart';
import 'package:marketsmart/routes/app_routes.dart';

void main() => runApp(const MarketSmartApp());

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