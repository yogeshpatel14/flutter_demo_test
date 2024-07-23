part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginStateInit extends LoginState {}

final class LoginLoading extends LoginState {
  LoginLoading({required this.isLoading});
  final bool isLoading;
}

class LoginSuccess extends LoginState {
  LoginSuccess(this.infoLogin);
  final Object infoLogin;
}

class LoginFail extends LoginState {
  LoginFail(this.errorMessage);
  final String errorMessage;
}

class CheckLoginFields extends LoginState {
  CheckLoginFields(this.isInputError);
  final bool isInputError;
}
