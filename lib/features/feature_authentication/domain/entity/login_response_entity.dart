import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable
{
  String? status;
  String? msg;
  LoginResponseEntity({this.status,this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [status,msg];
}