
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_authentication/data/models/LoginResponseModel.dart';
import 'package:navasan/features/feature_authentication/domain/entity/login_response_entity.dart';
import 'package:navasan/features/feature_authentication/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_source/local/auth_local_data.dart';
import '../data_source/remote/auth_api_provider.dart';

class AuthRepositoryImp extends AuthRepository{
  AuthApiProvider _apiProvider;
  AuthLocalData _authLocalData;
  AuthRepositoryImp(this._apiProvider,this._authLocalData);

  @override
  Future<DataState<LoginResponseEntity>> FetchLoginResponse(Username, Password)async {
    // TODO: implement FetchLoginResponse
    try
        {
          Response response=await _apiProvider.sendLoginRequest(Username, Password);
          if(response.statusCode==200)
            {
              LoginResponseEntity Lresponse=LoginResponseModel.fromJson(response.data);
              ///save user prefs
              final prefs=await SharedPreferences.getInstance();
              final _userData=json.encode(
                  {
                    'username':Username,
                    'password':Password,
                  });
              prefs.setBool('Authenticated', true);
              prefs.setString("UserData", _userData);
              return DataSuccess(Lresponse);



            }
          else
            {
              return DataFailed("an error occerd");
            }
        }
        catch(e)
    {
      return DataFailed("can not connect to server");
    }
  }

  @override
  Future<DataState<bool>> FetchAuthenticationStatus()async {
    // TODO: implement FetchAuthenticationStatus
    var response=await _authLocalData.checkAuthentication();
        return DataSuccess(response);

  }

  @override
  Future<DataState<LoginData>> FetchSavedUserData() async {
    // TODO: implement FetchSavedUserData
    var response=await _authLocalData.getSavedUsernameAndPassword();
    //final prefs=await SharedPreferences.getInstance();
     final extractedUserData = json.decode(response as String) as Map<String, dynamic>;
     final username=(extractedUserData['username'] as String);
     final password=(extractedUserData['password'] as String);
     if(extractedUserData==null)
     {
       return DataFailed("user not saved data");
     }
     else
     {
       return DataSuccess(LoginData(username: username,password: password));
     }
  }

}