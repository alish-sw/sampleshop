import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_authentication/presentation/bloc/login_status.dart';
import 'package:navasan/features/feature_authentication/presentation/bloc/user_profile_status.dart';

import '../../domain/use_cases/authentication_user_usecase.dart';
import '../../domain/use_cases/load_user_profile_usecase.dart';
import '../../domain/use_cases/login_user_usecase.dart';
import 'authentication_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUserUseCase _loginUserUseCase;
  AuthenticationUserUseCase _authenticationUserUseCase;
  LoadUserProfileUseCase _loadUserProfileUseCase;
  AuthBloc(this._loginUserUseCase,this._authenticationUserUseCase,this._loadUserProfileUseCase) : super(AuthState(loginStatus: LoginStatusLoading(),authenticationStatus: AuthenticationStatusLoading(),userProfileStatus: UserProfileStatusLoading())) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(newLoginStatus: LoginStatusLoading()));
      DataState dataState=await _loginUserUseCase.call(event.loginData);
      if(dataState is DataSuccess)
        {
          emit(state.copyWith(newLoginStatus: LoginStatusCompleted(dataState.data)));
        }
      if(dataState is DataFailed)
        {
          emit(state.copyWith(newLoginStatus: LoginStatusError(dataState.error)));
        }
    });
    on<AuthenticationEvent>((event,emit)async{
      emit(state.copyWith(newAuthenticationStatus: AuthenticationStatusLoading()));
      DataState dataState=await _authenticationUserUseCase.call(NoParams());
      if(dataState is DataSuccess)
        {
          emit(state.copyWith(newAuthenticationStatus: AuthenticationStatusCompleted(dataState.data)));
        }
    });

    on<UserPrfileEvent>((event,emit)async{
      emit(state.copyWith(newUserProfileStatus: UserProfileStatusLoading()));
      DataState dataState=await _loadUserProfileUseCase.call(NoParams());
      if(dataState is DataSuccess)
        {
          emit(state.copyWith(newUserProfileStatus: UserProfileStatusCompleted(dataState.data)));
        }
      if(dataState is DataFailed)
      {
        emit(state.copyWith(newUserProfileStatus: UserProfileStatusError(dataState.error)));
      }

    });
  }
}
