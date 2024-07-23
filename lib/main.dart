import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/src/bloc/index.dart';
import 'package:test_drive/src/custom_theme/color_list.dart';
import 'package:test_drive/src/routes/root_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // providers: [
        //   BlocProvider(create: (_) => CountrCubit()),
        //   BlocProvider(create: (_) => CounterBlock()),
        //   BlocProvider(create: (_) => LoginBloc())
        // ],
        providers: StoreBloc.multipleBlocList,
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: ThemeColors().primary,
            colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors().primary),
            useMaterial3: true,
          ),
          routerConfig: RootRouter.router,
        ));
  }
}
