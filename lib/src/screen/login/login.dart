import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_drive/src/bloc/login/login_bloc.dart';
import 'package:test_drive/src/components/button/custom_button.dart';
import 'package:test_drive/src/cubit/count_cubit.dart';
import 'package:test_drive/src/custom_theme/color_list.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final cubitCounter = CountrCubit();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blockLogin = BlocProvider.of<LoginBloc>(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).push('/dashboard');
        }
        if (state is LoginFail) {
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return MaterialApp(
            home: Material(
                child: Container(
          height: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: ctrlEmail,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 18,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          labelText: 'Mobile No.',
                          labelStyle: const TextStyle(color: Colors.white),
                          // hintStyle: const TextStyle(
                          //     color: Colors.white60, fontSize: 12),
                          errorText: state is CheckLoginFields &&
                                  state.isInputError &&
                                  ctrlEmail.text.isEmpty
                              ? 'please enter you Mobile No.'
                              : null),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: ctrlPassword,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.white,
                            size: 18,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          // hintStyle: const TextStyle(
                          //     color: Colors.white60, fontSize: 12),
                          errorText: state is CheckLoginFields &&
                                  state.isInputError &&
                                  ctrlPassword.text.isEmpty
                              ? 'please enter password'
                              : null),
                    ),
                  ),
                  if (state is LoginLoading && state.isLoading)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Transform.scale(
                        scale: 0.8,
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          color: ThemeColors().primary,
                        ),
                      ),
                    ),
                  if (state is LoginFail && state.errorMessage.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  CustomButton(
                    title: 'Submit',
                    btnClicked: () async {
                      final txtEmail = ctrlEmail.text;
                      final txtPwd = ctrlPassword.text;
                      blockLogin
                          .add(LoginApiCall(email: txtEmail, password: txtPwd));
                    },
                  )
                ],
              ),
            ),
          ),
        )));
      },
    );
  }
}
