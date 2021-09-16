part of 'signup_bloc.dart';
abstract class SignupState {}
class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {}
class SignupError extends SignupState {
  String message;
  SignupError(this.message);
}

