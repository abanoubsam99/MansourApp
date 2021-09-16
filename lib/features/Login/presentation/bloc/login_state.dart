part of 'login_bloc.dart';
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class UserLoginSuccess extends LoginState {}
class AdminLoginSuccess extends LoginState {}
class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}

