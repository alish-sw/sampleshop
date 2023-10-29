import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';
import 'package:navasan/features/feature_home/domain/repository/home_repository.dart';

class GetAllCategoryUseCase implements UseCase<DataState<CategoryEntity>,NoParams>
{
  final HomeRepository _homeRepository;
  GetAllCategoryUseCase(this._homeRepository);
  @override
  Future<DataState<CategoryEntity>> call(NoParams params) {
    // TODO: implement call
    return _homeRepository.FetchAllCategories();
  }

}