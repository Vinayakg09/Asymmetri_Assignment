part of 'my_bloc_bloc.dart';

@immutable
sealed class MyAppBlocEvent {}

class ColorSelect extends MyAppBlocEvent {
  final Color color;

  ColorSelect(this.color);
}

class SlideEvent extends MyAppBlocEvent {
  final double slide;

  SlideEvent(this.slide);
}
