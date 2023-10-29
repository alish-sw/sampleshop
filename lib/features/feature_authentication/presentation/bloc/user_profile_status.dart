import 'package:equatable/equatable.dart';
import 'package:navasan/core/usecases/usecase.dart';

abstract class UserProfileStatus extends Equatable {}


class UserProfileStatusLoading extends UserProfileStatus
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserProfileStatusCompleted extends UserProfileStatus
{
  LoginData _loginData;
  UserProfileStatusCompleted(this._loginData);
  @override
  // TODO: implement props
  List<Object?> get props => [_loginData];

}

class UserProfileStatusError extends UserProfileStatus
{
  String? _message;
  UserProfileStatusError(this._message);

  @override
  // TODO: implement props
  List<Object?> get props => [_message];

}