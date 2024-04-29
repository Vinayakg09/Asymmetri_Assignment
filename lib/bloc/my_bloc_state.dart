part of 'my_bloc_bloc.dart';

@immutable
sealed class MyAppBlocState {}

final class MyBlocInitial extends MyAppBlocState {}

final class ColorSelected extends MyAppBlocState {
  final Color color;

  ColorSelected(this.color);
}

final class ErrorState extends MyAppBlocState {
  final String error;

  ErrorState(this.error);
}

final class OnSlideState extends MyAppBlocState {
  final double value;

  OnSlideState(this.value);
}

final class BarNumState extends MyAppBlocState {
  final int value;

  BarNumState({required this.value});
}

final class BarInLineState extends MyAppBlocState {
  final int value;

  BarInLineState({required this.value});
}
