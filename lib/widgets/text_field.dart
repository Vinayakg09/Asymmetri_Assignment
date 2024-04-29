import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String lableText;
  Color color;
  MyTextField({required this.lableText, required this.color, super.key});

  

  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(width: 0.5, color: color);
    TextEditingController controller = TextEditingController();
    return SizedBox(
      width: 250,
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: lableText,
            labelStyle: TextStyle(color: color),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: _borderSide)),
      ),
    );
  }
}
