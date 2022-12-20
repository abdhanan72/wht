part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  LoginEvent({required this.Password, required this.email});
  String email;
  String Password;
}
