part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginApiCall extends LoginEvent {
  final String email;
  final String password;

  LoginApiCall({required this.email, required this.password});
}
