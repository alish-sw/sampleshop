part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class LoginEvent extends AuthEvent{
  final LoginData loginData;
  LoginEvent(this.loginData);
}

class AuthenticationEvent extends AuthEvent
{
  AuthenticationEvent();
}

class UserPrfileEvent extends AuthEvent
{
  final LoginData loginData;
  UserPrfileEvent(this.loginData);
}