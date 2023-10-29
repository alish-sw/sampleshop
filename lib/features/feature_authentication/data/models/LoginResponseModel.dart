import 'package:navasan/features/feature_authentication/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {

  LoginResponseModel({
      String ?status,
      String ?msg,}):super(
    status: status,
    msg: msg
  );

  LoginResponseModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    return map;
  }

}