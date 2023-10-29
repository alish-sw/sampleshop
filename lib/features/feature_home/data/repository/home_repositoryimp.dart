import 'package:dio/dio.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/features/feature_home/data/models/Category_model.dart';
import 'package:navasan/features/feature_home/data/models/Productsmodel.dart';
import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';
import 'package:navasan/features/feature_home/domain/entity/products_entitiy.dart';
import 'package:navasan/features/feature_home/domain/repository/home_repository.dart';

import '../data_source/remote/api_provider.dart';

class HomeRepositoryImp extends HomeRepository
{
  ApiProvider _apiProvider;
  HomeRepositoryImp(this._apiProvider);
  @override
  Future<DataState<ProductsEntity>> FetchAllProducts(productName) async {
    // TODO: implement FetchAllProducts
    try{
      Response response = await _apiProvider.sendRequestGetAllProducts(productName);

      if(response.statusCode == 200){
        // ignore: non_constant_identifier_names
        ProductsEntity PEntity = Productsmodel.fromJson(response.data);
        return DataSuccess(PEntity);
      }else{
        return const DataFailed("Something Went Wrong. try again...");
      }
    }catch(e){
      ///print(e.toString());
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<DataState<CategoryEntity>> FetchAllCategories() async {
    // TODO: implement FetchAllCategories
    try {
      Response response = await _apiProvider.sendRequestGetAllCategories();
      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        CategoryEntity CEntity = CategoryModel.fromJson(response.data);
        return DataSuccess(CEntity);
      }
      else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    }
    catch (e) {
      return const DataFailed("please check your connection...");
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Products>> FetchSuggestProducts(productName) async {
    Response response = await _apiProvider.sendRequestGetAllProducts(productName);
    Productsmodel data=Productsmodel.fromJson(response.data);
    return data.products!;
  }


}

