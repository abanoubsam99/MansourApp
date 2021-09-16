import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mansourapp/features/SignUp/data/repositories/SignUpRepository.dart';
part 'signup_event.dart';
part 'signup_state.dart';
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpRepositoryImp repository;
  SignupBloc(this.repository) : super(SignupInitial());
  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if(event is StartSignupEvent){
      yield SignupInitial();
    }
    else if(event is SignupButtonPressed){
      yield SignupLoading();
      try{
        var data=await repository.CreateUser(
          context: event.context,
          phone: event.phone,
          password: event.pass,
          name: event.name,
          email: event.email,
          client: event.client,
        );
        if(data.result==true){
          print("Login admin Success");
          yield SignupSuccess();
        }
      }catch (e){
        yield SignupError("Login Error");
      }
    }


  }
}
