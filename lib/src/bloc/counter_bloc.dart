import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBlock extends Bloc<CountEvent, int> {
  CounterBlock() : super(0) {
    on<IncreamentCount>((event, emit) {
      emit(state + 1);
    });
    on<DecreamentCount>((event, emit) {
      emit(state - 1);
    });
  }
}
