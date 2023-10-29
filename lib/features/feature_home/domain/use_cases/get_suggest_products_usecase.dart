import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/features/feature_home/data/models/Productsmodel.dart';
import 'package:navasan/features/feature_home/domain/entity/products_entitiy.dart';
import 'package:navasan/features/feature_home/domain/repository/home_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetSuggestProductsUseCase implements UseCase<List<Products>,String >
{
  final HomeRepository _homeRepository;
  GetSuggestProductsUseCase(this._homeRepository);

  @override
  Future<List<Products>> call(String productName) {
    // TODO: implement call
    return _homeRepository.FetchSuggestProducts(productName);
  }
}