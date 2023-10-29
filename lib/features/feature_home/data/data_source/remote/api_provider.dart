import 'package:dio/dio.dart';
import 'package:navasan/core/utils/constants.dart';

class ApiProvider
{
  final Dio _dio=Dio();
  Future<dynamic> sendRequestGetAllProducts(productName)async{
    var response=await _dio.get(
       // ignore: prefer_interpolation_to_compose_strings
       "${Constants.baseUrl}listProduct?q="+productName,
    );
    return response;
  }
  Future<dynamic> sendRequestGetAllCategories()async{
    var response=await _dio.get(
      "${Constants.baseUrl}listCategory",
    );
    return response;
  }
  Future<dynamic> sendRequestGetSuggestProduct(productName)async{
    var response=await _dio.get(
      "${Constants.baseUrl}listProduct?q="+productName,
    );
    return response;
  }
}