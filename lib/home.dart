import 'package:asymmetri/bloc/my_bloc_bloc.dart';
import 'package:asymmetri/myData.dart';
import 'package:asymmetri/widgets/drop_down.dart';
import 'package:asymmetri/widgets/loading.dart';
import 'package:asymmetri/widgets/slider.dart';
import 'package:asymmetri/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    String? initialSelect = MyData().colorNames.first;
    double current = 1;
    Color color = Colors.blue;
    int BarNum = 1;
    int BarInLine = 1;
    return Scaffold(
      body: BlocConsumer<MyAppBloc, MyAppBlocState>(
        listener: (context, state) {
          if (state is OnSlideState) {
            current = state.value;
          }
          if (state is ColorSelected) {
            initialSelect =
                MyData().colorNames[MyData().colors.indexOf(state.color)];
            color = state.color;
          }
          if (state is BarNumState) {
            BarNum = state.value;
          }
          if (state is BarInLineState) {
            BarInLine = state.value;
          }
          if (state is ErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text(state.error),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDropDown(
                    colorNames: MyData().colorNames,
                    colors: MyData().colors,
                    initialSelect: initialSelect,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MySlider(
                    color: color,
                    current: current,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    lableText: "Total Items",
                    color: color,
                    current: current.toInt(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    lableText: "Items in line",
                    color: color,
                    current: current.toInt(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 500,
                    width: 220,
                    child: GridView.count(
                      childAspectRatio: 10,
                      crossAxisCount: BarInLine,
                      mainAxisSpacing: 10,
                      children: List.generate(BarNum, (index) {
                        return MyProgressBar(
                            color: color, duration: current.round());
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
