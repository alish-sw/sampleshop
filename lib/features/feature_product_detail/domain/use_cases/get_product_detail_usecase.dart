import 'dart:ffi';

import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/core/usecases/usecase.dart';
import 'package:navasan/features/feature_product_detail/domain/entity/product_detail_entity.dart';
import 'package:navasan/features/feature_product_detail/domain/repository/product_detail_repository.dart';

class GetProductDetailUseCase implements UseCase<DataState<ProductDetailEntity>,int>
{
 final ProductDetailRepository _productDetailRepository;
 GetProductDetailUseCase(this._productDetailRepository);
  @override
  Future<DataState<ProductDetailEntity>> call(int productId) {
    // TODO: implement call
    return _productDetailRepository.FetchOneProduct(productId);
  }


}