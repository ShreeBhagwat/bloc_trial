import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncreamentEvent extends CounterEvent {}

class DecreamentEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncreamentEvent>(increament);
    on<DecreamentEvent>(decreament);
  }

  void increament(IncreamentEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  void decreament(DecreamentEvent event, Emitter<int> emit) {
    emit(state - 1);
  }
}
