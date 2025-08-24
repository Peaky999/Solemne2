import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/login/login2_widget.dart';

class LoginWidget extends StatelessWidget {
  final Widget child;
  const LoginWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Login2Widget(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Icon(Icons.person_pin, color: const Color.fromARGB(255, 255, 255, 255), size: 120),
            ),
          ),
          child
        ],
      ),
    );
  }
}
