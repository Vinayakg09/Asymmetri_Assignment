import 'package:asymmetri/bloc/my_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTextField extends StatelessWidget {
  String lableText;
  Color color;
  int current;
  MyTextField(
      {required this.current,
      required this.lableText,
      required this.color,
      super.key});

  Widget build(BuildContext context) {
    BorderSide _borderSide = BorderSide(width: 0.5, color: color);
    TextEditingController controller = TextEditingController();
    return SizedBox(
      width: 250,
      height: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: lableText,
            labelStyle: TextStyle(color: color),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: _borderSide)),
        onFieldSubmitted: (value) {
          int myValue = int.parse(controller.text);
          BlocProvider.of<MyAppBloc>(context)
                .add(BarEvent(lable: lableText, value: myValue));
        },
      ),
    );
  }
}
