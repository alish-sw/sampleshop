part of 'products_detail_bloc.dart';

@immutable
class ProductsDetailState extends Equatable {
  ProductDetailStatus productDetailStatus;
  ProductsAllImagesStatus productAllImagesStatus;
  ProductsDetailState({required this.productDetailStatus,required this.productAllImagesStatus});


  ProductsDetailState copyWith({ProductDetailStatus?newProductDetailStatus,ProductsAllImagesStatus?newProductsAllImagesStatus}){
   return ProductsDetailState(
       productDetailStatus:newProductDetailStatus?? productDetailStatus,
       productAllImagesStatus:newProductsAllImagesStatus??productAllImagesStatus) ;

  }
  @override
  // TODO: implement props
  List<Object?> get props => [productDetailStatus,productAllImagesStatus];
}


