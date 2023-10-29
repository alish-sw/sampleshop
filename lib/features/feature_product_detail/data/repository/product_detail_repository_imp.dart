import 'package:dio/dio.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/features/feature_product_detail/data/data_source/remote/product_api_provider.dart';
import 'package:navasan/features/feature_product_detail/data/models/ProductDetailModel.dart';



import 'package:navasan/features/feature_product_detail/domain/entity/product_detail_entity.dart';

import 'package:navasan/features/feature_product_detail/domain/repository/product_detail_repository.dart';

import '../../domain/entity/product_all_images_entity.dart';
import '../models/ProductAllImagesModel.dart';

class ProductDetailrepositoryImp extends ProductDetailRepository{
  ProductApiProvider _apiProvider;
  ProductDetailrepositoryImp(this._apiProvider);
  @override
  Future<DataState<ProductDetailEntity>> FetchOneProduct(ProductId) async {
    // TODO: implement FetchOneProduct
try {
  Response response = await _apiProvider.sendRequsetGetProductDetail(ProductId);

  if (response.statusCode == 200) {

    ProductDetailEntity PDEntity = ProductDetailModel.fromJson(response.data);

    return DataSuccess(PDEntity);
  }
  else {
    return DataFailed("an erorr occerd on load data");
  }
}
catch(e)
    {
      return DataFailed("Please Chaeck Your Internet Connection");
    }

  }

  @override
  Future<DataState<ProductAllImgaesEntity>> FetchAllProductImages(ProductId) async {
    // TODO: implement FetchAllProductImages
    try
    {
      Response response=await _apiProvider.sendRequestGetAllProductImages(ProductId);
      if(response.statusCode==200)
        {
          ProductAllImgaesEntity PIEntity=ProductAllImagesModel.fromJson(response.data) ;
          return DataSuccess(PIEntity);
        }
      else
        {
          return DataFailed("products Images cant load");
        }
    }
        catch(e)
    {
      return DataFailed("Please Chaeck Your Internet Connection");
    }
  }
  @override
  dispose()
  {
    _apiProvider.dispose();
  }
  
}