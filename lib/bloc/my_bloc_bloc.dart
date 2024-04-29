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
  }
}
