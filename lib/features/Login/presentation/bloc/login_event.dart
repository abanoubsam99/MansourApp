part of 'login_bloc.dart';
abstract class LoginEvent {}
class StartEvent extends LoginEvent{}
class LoginButtonPressed extends LoginEvent{
  final BuildContext context;
  final String name;
  final String pass;
  LoginButtonPressed({this.name, this.pass,this.context});
}
