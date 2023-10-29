import 'package:dio/dio.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_product_detail/data/data_source/remote/product_api_provider.dart';


import '../entity/product_all_images_entity.dart';
import '../repository/product_detail_repository.dart';

class GetAllProductImagesUseCase implements UseCase<DataState<ProductAllImgaesEntity>,int>
{
  final ProductDetailRepository _productDetailRepository;
  GetAllProductImagesUseCase(this._productDetailRepository);


  @override
  Future<DataState<ProductAllImgaesEntity>> call(int ProductId) {
    // TODO: implement call
    return _productDetailRepository.FetchAllProductImages(ProductId);
  }
   dispose()
   {
     _productDetailRepository.dispose();
   }
}