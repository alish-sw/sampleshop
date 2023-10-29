import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/features/feature_home/data/models/Productsmodel.dart';
import 'package:navasan/features/feature_home/domain/entity/products_entitiy.dart';
import 'package:navasan/features/feature_home/domain/repository/home_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetAllProductsUseCase implements UseCase<DataState<ProductsEntity>,String >
{
  final HomeRepository _homeRepository;
  GetAllProductsUseCase(this._homeRepository);

  @override
  Future<DataState<ProductsEntity>> call(String productName) {
    // TODO: implement call
    return _homeRepository.FetchAllProducts(productName);
  }
}