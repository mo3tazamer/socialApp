part of 'logincubit_cubit.dart';

@immutable
abstract class LogincubitState {}

class LogincubitInitial extends LogincubitState {}

class Logincubitloading extends LogincubitState {}

class Logincubitsucsess extends LogincubitState {}

class Logincubiterror extends LogincubitState {
  var error;

  Logincubiterror(this.error);
}
