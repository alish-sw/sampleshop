import 'package:dio/dio.dart';
import 'package:navasan/core/utils/constants.dart';

class ProductApiProvider{
  final Dio _dio=Dio();
  Future<dynamic> sendRequsetGetProductDetail(ProductId)async
  {
    var response=await _dio.get(
        // ignore: prefer_interpolation_to_compose_strings
        "${Constants.baseUrl}getOneProduct?id="+ProductId.toString()
    );
    return response;
  }
  Future<dynamic> sendRequestGetAllProductImages(ProductId)async
  {
    var response=await _dio.get(
        // ignore: prefer_interpolation_to_compose_strings
        "${Constants.baseUrl}getAllProductImageByProductId?product_id="+ProductId.toString()
    );
    return response;
  }
  dispose()
  {
    _dio.close();
  }
}