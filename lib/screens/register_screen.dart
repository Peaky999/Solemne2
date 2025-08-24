import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/login/login3_widget.dart';
import 'package:marketsmart/widgets/login/login_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: LoginWidget(
        child: Login3Widget(
          textTitle: 'Registro',
          textFinalButton: 'Ingresar si tienes cuenta.',
          path: 'login',
          textButton: 'Aceptar',
          pathButton: 'error', //consumir servicio
        ),
      ),
    );
  }
}