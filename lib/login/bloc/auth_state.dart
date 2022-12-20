part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSucces extends AuthState {}

class LoginFailed extends AuthState {
  LoginFailed({required this.message});
  String message;
}
