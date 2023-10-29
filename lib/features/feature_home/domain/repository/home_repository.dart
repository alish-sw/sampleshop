import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/Productsmodel.dart';
import '../entity/products_entitiy.dart';

abstract class HomeRepository
{
  // ignore: non_constant_identifier_names
  Future<DataState<ProductsEntity>>FetchAllProducts(productName);
  Future<DataState<CategoryEntity>>FetchAllCategories();
  Future<List<Products>>FetchSuggestProducts(productName);
}