part of 'products_detail_bloc.dart';

@immutable
abstract class ProductsDetailEvent {}

class ProductDetailEvents extends ProductsDetailEvent{
  final int productId;
  ProductDetailEvents(this.productId);
}
class ProductAllImagesEvents extends ProductsDetailEvent{
  final int productId;
  ProductAllImagesEvents(this.productId);
}