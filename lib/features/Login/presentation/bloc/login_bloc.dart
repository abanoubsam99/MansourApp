import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mansourapp/features/Login/data/repositories/LoginRepository.dart';
part 'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepositoryImp repository;
  LoginBloc(this.repository) : super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is StartEvent){
      yield LoginInitial();
    }
    else if(event is LoginButtonPressed){
      yield LoginLoading();
      try{
        var data=await repository.LoginUser(
          context: event.context,
          password: event.pass,
          name: event.name,
        );
        if(data.isAdmin==true){
          print("Login admin Success");
          yield AdminLoginSuccess();
        }else if(data.isAdmin==false){
          print("Login user Success");
          yield UserLoginSuccess();

        }
      }catch(e){
        yield LoginError("Login Error");
      }
    }
  }
}
