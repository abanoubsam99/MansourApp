part of 'signup_bloc.dart';
abstract class SignupEvent {
}
class StartSignupEvent extends SignupEvent{}
class SignupButtonPressed extends SignupEvent{
  final BuildContext context;
  final String name;
  final String email;
  final String pass;
  final String phone;
  final String client;
  SignupButtonPressed({this.name, this.email, this.pass, this.phone, this.client,this.context});
}


