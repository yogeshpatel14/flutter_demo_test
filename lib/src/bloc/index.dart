import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/src/bloc/counter_bloc.dart';
import 'package:test_drive/src/bloc/login/login_bloc.dart';
import 'package:test_drive/src/cubit/count_cubit.dart';

class StoreBloc {
  static List<BlocProvider<StateStreamableSource<Object>>> multipleBlocList = [
    BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
    BlocProvider<CountrCubit>(create: (_) => CountrCubit()),
    BlocProvider<CounterBlock>(create: (_) => CounterBlock()),
  ];
}
