import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_authentication/data/data_source/local/auth_local_data.dart';
import 'package:navasan/features/feature_authentication/domain/repository/auth_repository.dart';

class LoadUserProfileUseCase implements UseCase<DataState<LoginData>,NoParams>
{
  AuthRepository _authRepository;
  LoadUserProfileUseCase(this._authRepository);

  @override
  Future<DataState<LoginData>> call(NoParams params) {
    // TODO: implement call
    return _authRepository.FetchSavedUserData();
  }

}