part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  LoginStatus loginStatus;
  AuthenticationStatus authenticationStatus;
  UserProfileStatus userProfileStatus;
  AuthState({required this.loginStatus,required this.authenticationStatus,required this.userProfileStatus});

  AuthState copyWith({LoginStatus?newLoginStatus,
    AuthenticationStatus?newAuthenticationStatus,
    UserProfileStatus?newUserProfileStatus
  })
  {
    return AuthState(loginStatus:newLoginStatus?? loginStatus,
        authenticationStatus: newAuthenticationStatus??authenticationStatus,
        userProfileStatus: newUserProfileStatus??userProfileStatus
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loginStatus,authenticationStatus,userProfileStatus];

}


