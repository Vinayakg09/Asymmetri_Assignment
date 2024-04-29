part of 'my_bloc_bloc.dart';

@immutable
sealed class MyAppBlocState {}

final class MyBlocInitial extends MyAppBlocState {}

final class ColorSelected extends MyAppBlocState {
  final Color color;

  ColorSelected(this.color);
}

final class ErrorState extends MyAppBlocState {
  final String? error;

  ErrorState(this.error);
}

final class OnSlideState extends MyAppBlocState {
  final double value;

  OnSlideState(this.value);
}
