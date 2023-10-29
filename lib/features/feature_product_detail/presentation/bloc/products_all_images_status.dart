import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entity/product_all_images_entity.dart';



abstract class ProductsAllImagesStatus extends Equatable{}


class ProductAllImagesLoading extends ProductsAllImagesStatus
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductsAllImagesCompleted extends ProductsAllImagesStatus
{
  ProductAllImgaesEntity allImagesEntity;
  ProductsAllImagesCompleted(this.allImagesEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [allImagesEntity];
}
class ProductsAllImagesError extends ProductsAllImagesStatus
{
  String message;
  ProductsAllImagesError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}