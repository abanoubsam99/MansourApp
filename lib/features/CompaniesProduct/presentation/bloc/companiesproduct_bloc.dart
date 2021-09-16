import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'companiesproduct_event.dart';
part 'companiesproduct_state.dart';
class CompaniesproductBloc extends Bloc<CompaniesproductEvent, CompaniesproductState> {
  CompaniesproductBloc() : super(CompaniesproductInitial());
  @override
  Stream<CompaniesproductState> mapEventToState(
    CompaniesproductEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
