part of 'Register_cubit.dart';

abstract class RegisterState {}

class RegistercubitInitial extends RegisterState {}

class Registercubitloading extends RegisterState {}

class Registercubitsucsess extends RegisterState {}

class Registercubiterror extends RegisterState {}

class UserCreatecubitsucsess extends RegisterState {}

class UserCreatecubitloading extends RegisterState {}

class UserCreatecubiterror extends RegisterState {
  var error;
  UserCreatecubiterror(this.error);
}
