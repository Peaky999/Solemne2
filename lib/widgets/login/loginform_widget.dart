import 'package:flutter/material.dart';
import 'package:marketsmart/services/auth_services.dart';
import 'package:marketsmart/ui/input_decoration.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';

class LoginformWidget extends StatelessWidget {
  final String TextButton;
  final String PathButton;
  final int loginRegister; //1 login 2 register
  const LoginformWidget({
    super.key,
    required this.TextButton,
    required this.PathButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: LoginForm.formkey,
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
            onChanged: (value) => LoginForm.email = value,
            validator: (value) {
              return (value != null && value.length > 4)
                  ? null
                  :'El correo no es válido';
            },
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
            onChanged: (value) => LoginForm.password = value,
            validator: (value) {
              return (value != null && value.length > 4)
                  ? null
                  :'Contraseña no válida';
            },
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
            onPressed: LoginForm.isLoading ? null : () async {
              FocusScope.of(context).unfocus();
              final AuthService = Provider.of<AuthServices>(context, listen: false);
              if (!LoginForm.isValidForm()) return;
              if(loginRegister == 1){
                final String? errorMessage = await AuthService.login(LoginForm.email, LoginForm.password);
                if (errorMessage == null) {
                  Navigator.pushNamed(context, PathButton);
                } else {
                  print(errorMessage);
                }
              }else{
                final String? errorMessage = await AuthService.createuser(LoginForm.email, LoginForm.password);
                if (errorMessage == null) {
                  Navigator.pushNamed(context, PathButton);
                } else {
                  print(errorMessage);
                }
              }     
                LoginForm.isLoading = false;
            }
          ),
        ],
      ),
    );
  }
}
