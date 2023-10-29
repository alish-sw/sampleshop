
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/login_response_entity.dart';

abstract class AuthRepository{
  Future<DataState<LoginResponseEntity>>FetchLoginResponse(Username,Password);
  ///for local data
  Future<DataState<bool>>FetchAuthenticationStatus();
  Future<DataState<LoginData>>FetchSavedUserData();
}