import 'package:flutter/material.dart';
import 'package:marketsmart/ui/input_decoration.dart';

class LoginformWidget extends StatelessWidget {
  final String TextButton;
  final String PathButton;
  const LoginformWidget({
    super.key,
    required this.TextButton,
    required this.PathButton,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Ingrese su correo',
              labelText: 'Email',
              prefixIcon: Icons.people_alt_outlined
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Ingrese su contraseña',
              labelText: 'Contraseña',
              prefixIcon: Icons.password
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ) ,
            disabledColor: Colors.grey,
            color:Color.fromRGBO(150, 0, 0, 1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: Text(TextButton, style: TextStyle(color: Colors.white)),
            ),
            elevation: 0,
            onPressed: () => Navigator.pushNamed(context,PathButton))
        ],
      ),
    );
  }
}
