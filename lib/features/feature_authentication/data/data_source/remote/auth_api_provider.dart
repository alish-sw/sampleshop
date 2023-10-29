import 'package:dio/dio.dart';
import 'package:navasan/core/utils/constants.dart';

class AuthApiProvider
{
  final Dio _dio=Dio();
  Future<dynamic>sendLoginRequest(Username,Password)async{
    var response = await _dio.post(
        "${Constants.baseUrl}login",
        data: {'username': Username, 'password': Password});
    return response;
  }


}