import 'package:equatable/equatable.dart';
import 'package:navasan/features/feature_product_detail/domain/entity/product_detail_entity.dart';

abstract class ProductDetailStatus extends Equatable{}


class ProductDetailLoading extends ProductDetailStatus
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductDetailCompleted extends ProductDetailStatus
{
  ProductDetailEntity productDetailEntity;
  ProductDetailCompleted(this.productDetailEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [productDetailEntity];
}


class ProductDetailError extends ProductDetailStatus
{
  String message;
  ProductDetailError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}