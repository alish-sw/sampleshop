

import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class AuthenticationUserUseCase implements UseCase<DataState<bool>,NoParams>
{
  AuthRepository _authRepository;
  AuthenticationUserUseCase(this._authRepository);
  @override
  Future<DataState<bool>> call(NoParams params) {
    // TODO: implement call
    return _authRepository.FetchAuthenticationStatus();
  }
}