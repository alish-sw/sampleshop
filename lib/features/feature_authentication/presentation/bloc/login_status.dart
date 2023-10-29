import 'package:equatable/equatable.dart';
import 'package:navasan/features/feature_authentication/domain/entity/login_response_entity.dart';

abstract class LoginStatus extends Equatable {}


class LoginStatusLoading extends LoginStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginStatusCompleted extends LoginStatus{

  LoginResponseEntity loginResponseEntity;
  LoginStatusCompleted(this.loginResponseEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [loginResponseEntity];

}

class LoginStatusError extends LoginStatus{
  String? message;
  LoginStatusError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}