import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(150, 0, 0, 1)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(150, 0, 0, 1), width: 3),
      ),
      hintText: hinText,
      labelText: labelText,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Color.fromRGBO(150, 0, 0, 1))
          : null,
    );
  }
}
