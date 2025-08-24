import 'package:flutter/material.dart';

class Login2Widget extends StatelessWidget{
  const Login2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height:sizeScreen.height * 0.4 ,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(150, 0, 0, 1),
          Color.fromRGBO(175, 95, 95, 1)])
      ) ,
    );
  }
  
}