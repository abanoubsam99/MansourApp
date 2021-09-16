import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'latestproducts_event.dart';
part 'latestproducts_state.dart';
class LatestproductsBloc extends Bloc<LatestproductsEvent, LatestproductsState> {
  LatestproductsBloc() : super(LatestproductsInitial());
  @override
  Stream<LatestproductsState> mapEventToState(
    LatestproductsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
