import 'package:navasan/features/feature_product_detail/domain/entity/product_detail_entity.dart';


import '../../../../core/resources/data_state.dart';
import '../entity/product_all_images_entity.dart';

abstract class ProductDetailRepository{
  Future<DataState<ProductDetailEntity>>FetchOneProduct(ProductId);
  Future<DataState<ProductAllImgaesEntity>>FetchAllProductImages(ProductId);
  dispose();
}