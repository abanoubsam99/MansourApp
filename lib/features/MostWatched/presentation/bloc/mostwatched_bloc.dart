import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'mostwatched_event.dart';
part 'mostwatched_state.dart';
class MostwatchedBloc extends Bloc<MostwatchedEvent, MostwatchedState> {
  MostwatchedBloc() : super(MostwatchedInitial());
  @override
  Stream<MostwatchedState> mapEventToState(
    MostwatchedEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
