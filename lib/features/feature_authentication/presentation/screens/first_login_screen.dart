import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/widgets/main_warpper.dart';
import 'package:navasan/features/feature_authentication/presentation/bloc/authentication_status.dart';
import 'package:navasan/features/feature_authentication/presentation/bloc/login_status.dart';

import '../../../../core/bloc/bottom_icon_cubit.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../locator.dart';
import '../../../feature_home/presentation/bloc/home_bloc.dart';
import '../../../feature_product_detail/presentation/bloc/products_detail_bloc.dart';
import '../../domain/entity/login_response_entity.dart';
import '../bloc/auth_bloc.dart';

class FirstLoginScreen extends StatefulWidget {

FirstLoginScreen({Key? key}) : super(key: key);
@override
_FirstLoginScreen createState() => _FirstLoginScreen( );
}
class _FirstLoginScreen extends State<FirstLoginScreen> {
  bool isloading=false;
  late LoginData _loginData;
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();
  _FirstLoginScreen();
  //late LoginData _loginData;
  @override
  void initState() {
    // TODO: implement initState
    //BlocProvider.of<AuthBloc>(context).add(LoginEvent(LoginData(username: "ali", password: "vali")));
    BlocProvider.of<AuthBloc>(context).add(AuthenticationEvent());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    _onLoginButtonPressed() {
      {
        BlocProvider.of<AuthBloc>(context).add(
            LoginEvent(LoginData(username: _userController.text, password: _passwordController.text)));
      }
    }
    _showSnakeBar(String msg)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating, // Add this line
      ));
    }
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
      if (state.authenticationStatus is AuthenticationStatusCompleted) {
        final AuthenticationStatusCompleted authstate = state
            .authenticationStatus as AuthenticationStatusCompleted;
        bool response = authstate.authState!;
        if (response == true) {
          Future.delayed(Duration.zero, () {
            Navigator.of(context).push(
              MaterialPageRoute<MainWarpper>(
                builder: (_) =>
                    MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => locator<HomeBloc>()),
                        BlocProvider(create: (_) => locator<AuthBloc>()),
                        BlocProvider(create: (_) =>
                            locator<
                                BottomIconCubit>()),
                      ],
                      child: MainWarpper(),

                    ),
              ),
            );
          },);
        }
         }
        if (state.loginStatus is LoginStatusError) {
          final LoginStatusError fwError = state
              .loginStatus as LoginStatusError;
          _showSnakeBar(fwError.message!);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.loginStatus is LoginStatusCompleted) {
            final LoginStatusCompleted loginres=state.loginStatus as LoginStatusCompleted;
            LoginResponseEntity response=loginres.loginResponseEntity;
            if(response.status=="success")
              {
                Future.delayed(Duration.zero,()
                {
                  Navigator.of(context).push(
                    MaterialPageRoute<MainWarpper>(
                      builder: (_) =>
                          MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (_) => locator<HomeBloc>()),
                              BlocProvider(create: (_) => locator<AuthBloc>()),
                              BlocProvider(create: (_) =>
                                  locator<
                                      BottomIconCubit>()),
                            ],
                            child: MainWarpper(),

                          ),
                    ),
                  );
                },);

              }
            else
              {
                Future.delayed(Duration.zero,()
                {
                  _showSnakeBar("username or password is incorrect");
                });
              }

          }
          return Scaffold(
            backgroundColor: Color(0xffffffff),
            body: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          "Login to Continue",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Color(0xffa29b9b),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child:

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8QidTe3QwykkCOV_Pb0UnvF7rbzyGq0sNcGXxMmpWXX2mC73f1AKaYQdxiIzZYZ-spew&usqp=CAU"),
                            height: 120,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Username'),
                        controller: _userController,
                        keyboardType: TextInputType.text,

                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'password'),
                          obscureText: true,

                          controller: _passwordController,

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
                        child: MaterialButton(
                          onPressed: () {
                            _onLoginButtonPressed();
                          },
                          //   buildWhen: (previous, current) {
                          //   /// rebuild UI just when allCityStatus Changed
                          //   if (current.loginStatus== previous.loginStatus) {
                          //     return false;
                          //   }
                          //   else {
                          //     return true;
                          //   }
                          //   },
                          //   builder: (context, state) {
                          //     /// show Loading for AllCityStatus
                          //   if (state.loginStatus is LoginStatusLoading) {
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text("username or password is incorrect"),
                          //       behavior: SnackBarBehavior.floating, // Add this line
                          //     ));
                          //
                          //   }
                          //   if (state.loginStatus is LoginStatusCompleted) {
                          //     /// casting for getting cities
                          //     final LoginStatusCompleted g = state.loginStatus as LoginStatusCompleted;
                          //     LoginResponseEntity response = g.loginResponseEntity;
                          //
                          //     (response.msg!="Success")
                          //         ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text("username or password is incorrect"),
                          //       behavior: SnackBarBehavior.floating, // Add this line
                          //     ))
                          //
                          //         : Navigator.of(context).push(
                          //       MaterialPageRoute<MainWarpper>(
                          //         builder: (_) => MultiBlocProvider(
                          //           providers: [
                          //             BlocProvider(create: (_) => locator<HomeBloc>()),
                          //             BlocProvider(create: (_) => locator<AuthBloc>()),
                          //             BlocProvider(create: (_) => locator<BottomIconCubit>()),
                          //
                          //           ],
                          //           child: MainWarpper(),
                          //
                          //       ),
                          //     ),);
                          //   }
                          //   if (state.loginStatus is LoginStatusError) {
                          //     final LoginStatusError fwError = state.loginStatus as LoginStatusError;
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(fwError.message!),
                          //       behavior: SnackBarBehavior.floating, // Add this line
                          //     ));
                          //   }
                          //   return Text("asd");
                          // },);
                          color: Color(0xff3a57e8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: Color(0xffffffff),
                          height: 50,
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),);
        },)
      ,);
  }
}





