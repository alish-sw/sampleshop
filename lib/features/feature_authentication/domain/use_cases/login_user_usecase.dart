import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_authentication/domain/entity/login_response_entity.dart';
import 'package:navasan/features/feature_authentication/domain/repository/auth_repository.dart';

class LoginUserUseCase implements UseCase<DataState<LoginResponseEntity>,LoginData>
{
  AuthRepository _authRepository;
  LoginUserUseCase(this._authRepository);
  @override
  Future<DataState<LoginResponseEntity>> call(LoginData user) {
    // TODO: implement call
    return _authRepository.FetchLoginResponse(user.username, user.password);
  }

}