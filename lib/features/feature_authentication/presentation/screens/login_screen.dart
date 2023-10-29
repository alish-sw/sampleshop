
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_authentication/presentation/bloc/authentication_status.dart';

import '../bloc/auth_bloc.dart';
import 'first_login_screen.dart';

class LoginScreen extends StatefulWidget {
  late PageController pageController;
  LoginScreen({Key? key,required this.pageController}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState( pageController: this.pageController);
}
class _LoginScreenState extends State<LoginScreen> {

  late PageController pageController;
  _LoginScreenState({required this.pageController});
  //late LoginData _loginData;
  @override
  void initState() {
    // TODO: implement initState
    //BlocProvider.of<AuthBloc>(context).add(LoginEvent(_loginData));
    BlocProvider.of<AuthBloc>(context).add(AuthenticationEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) {
      /// rebuild UI just when allCityStatus Changed
      if (current.authenticationStatus== previous.authenticationStatus) {
        return false;
      } else {
        return true;
      }
    },
    builder: (context, state) {
    /// show Loading for AllCityStatus
    if (state.authenticationStatus is AuthenticationStatusLoading) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    if (state.authenticationStatus is AuthenticationStatusCompleted) {
      /// casting for getting cities
      final AuthenticationStatusCompleted g = state.authenticationStatus as AuthenticationStatusCompleted;
      bool ?authstate=g.authState;
      return (authstate==null || authstate==false)
          ? FirstLoginScreen()
          :
      Center(
        child: Text(
          'login',
          style: TextStyle(color: Colors.black),
        ),
      );
      }
    return Container();
    },
    );
}
}