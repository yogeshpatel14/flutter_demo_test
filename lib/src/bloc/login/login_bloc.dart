import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_drive/src/modal/auth/login_modal.dart';
import 'package:test_drive/src/rest_api/url_schemas.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateInit()) {
    on<LoginApiCall>((event, emit) async {
      if (event.email.characters.isNotEmpty &&
          event.password.characters.isNotEmpty) {
        emit(LoginLoading(isLoading: true));
        final response =
            await http.post(Uri.https('dev.test.me', '/api/login'), body: {
          'mobile_number': '1234567892',
          'password': 'Test@1234',
          'UUID': 'maj7sujjja',
          'dial_code': '+91'
        }, headers: {
          'accept': 'application/json'
        });

        final Map<String, dynamic> resJson =
            jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (resJson['success']) {
            final Map<String, dynamic> jsonData =
                jsonDecode(response.body)['data'] as Map<String, dynamic>;
            // final ModalLogin login =
            //     ModalLogin.fromJson(jsonData['user_details']);
            final responseVerify = await http
                .post(Uri.https('dev.test.me', '/api/verifyLoginOtp'), body: {
              'mobile_number': '1234567892',
              'dial_code': '+91',
              'otp': jsonData['otp']
            }, headers: {
              'accept': 'application/json'
            });
            emit(LoginSuccess(responseVerify.body));
          } else {
            emit(LoginFail(jsonDecode(response.body)['message'] as String));
          }
        }

        emit(LoginLoading(isLoading: false));
      } else {
        emit(CheckLoginFields(true));
      }
    });
  }
}
