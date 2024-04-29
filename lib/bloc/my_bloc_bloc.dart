import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyAppBloc extends Bloc<MyAppBlocEvent, MyAppBlocState> {
  MyAppBloc() : super(MyBlocInitial()) {
    on<ColorSelect>((event, emit) {
      try {
        emit(ColorSelected(event.color));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<SlideEvent>((event, emit) {
      try {
        emit(OnSlideState(event.slide));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<BarEvent>((event, emit) {
      try {
        if (event.lable == "Total Items") {
          if (event.value >= 0 && event.value <= 30) {
            emit(BarNumState(value: event.value));
          } else {
            emit(ErrorState("Bar Values can't be more than 30"));
          }
        } else {
          if (event.value >= 0 && event.value <= 4) {
            emit(BarInLineState(value: event.value));
          } else {
            emit(ErrorState("Only 4 bar are allowed in one line"));
          }
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
