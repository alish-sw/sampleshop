import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/usecases/usecase.dart';

class AuthLocalData
{

  Future<dynamic?>checkAuthentication() async {
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool('Authenticated');

  }
  Future<dynamic?>getSavedUsernameAndPassword()async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString('UserData');
    // final prefs=await SharedPreferences.getInstance();
    // final extractedUserData = json.decode(prefs.getString('UserData')as String) as Map<String, dynamic>;
    // final username=(extractedUserData['username'] as String);
    // final password=(extractedUserData['password'] as String);
    // if(extractedUserData==null)
    // {
    //   return null;
    // }
    // else
    // {
    //   return LoginData(username: username,password: password);
    // }
  }
}