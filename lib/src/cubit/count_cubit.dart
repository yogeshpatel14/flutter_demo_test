import 'package:flutter_bloc/flutter_bloc.dart';

class CountrCubit extends Cubit<int> {
  CountrCubit() : super(0);

  void updateCounter() {
    emit(state + 1);
  }
}
