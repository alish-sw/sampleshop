import 'package:equatable/equatable.dart';

abstract class AuthenticationStatus extends Equatable {}


class AuthenticationStatusLoading extends AuthenticationStatus
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class AuthenticationStatusCompleted extends AuthenticationStatus
{
  bool ?authState;
  AuthenticationStatusCompleted(this.authState);
  @override
  // TODO: implement props
  List<Object?> get props => [authState];

}

