import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/login/loginform_widget.dart';
import 'package:marketsmart/widgets/widgets.dart';

class Login3Widget extends StatelessWidget {
  final String textTitle;
  final String textFinalButton;
  final String path;
  final String textButton;
  final String pathButton;

  const Login3Widget({
    super.key,
    required this.textTitle,
    required this.textFinalButton,
    required this.path,
    required this.textButton,
    required this.pathButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 200),
          TarjetaloginWidget(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  textTitle,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),
                LoginformWidget(TextButton: textButton, PathButton: pathButton),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, path),
                  child: Text(textFinalButton),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
