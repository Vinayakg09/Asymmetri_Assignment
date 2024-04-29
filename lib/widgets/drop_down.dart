import 'package:asymmetri/bloc/my_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDropDown extends StatelessWidget {
  String? initialSelect;
  List colorNames;
  List colors;
  MyDropDown(
      {required this.colors, required this.colorNames, required this.initialSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: DropdownButton(
        value: initialSelect,
        isExpanded: true,
        items: colorNames
            .map((colorName) => DropdownMenuItem(
                  value: colorName,
                  child: Text(colorName),
                ))
            .toList(),
        onChanged: (value) {
          BlocProvider.of<MyAppBloc>(context)
              .add(ColorSelect(colors[colorNames.indexOf(value!)]));
        },
      ),
    );
  }
}

