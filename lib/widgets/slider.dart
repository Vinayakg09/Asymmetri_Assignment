import 'package:asymmetri/bloc/my_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySlider extends StatelessWidget {
  Color color;
  double current;
  MySlider({required this.color, required this.current,super.key});

  Widget build(BuildContext context) {
        return SizedBox(
          width: 300,
          child: Slider(
            value: current,
            divisions: 2,
            min: 1,
            max: 100,
            label: current == 1 ? 'Slow' : current == 50.5 ? 'Smooth' : 'Fast',
            activeColor: color,
            onChanged: (value) {
              BlocProvider.of<MyAppBloc>(context).add(SlideEvent(value));
            },
          ),
        );
      }
  }
