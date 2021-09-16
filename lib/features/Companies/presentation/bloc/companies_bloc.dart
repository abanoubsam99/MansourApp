import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'companies_event.dart';
part 'companies_state.dart';
class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  CompaniesBloc() : super(CompaniesInitial());
  @override
  Stream<CompaniesState> mapEventToState(
    CompaniesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
