import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:navasan/features/feature_home/domain/entity/products_entitiy.dart';

@immutable
abstract class HomeProductsState extends Equatable{}


class HomeProductsLoading extends HomeProductsState
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomeProductsCompleted extends HomeProductsState
{
  final ProductsEntity productsEntity;
  HomeProductsCompleted(this.productsEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [productsEntity,];

}
class HomeProductsError extends HomeProductsState
{
  final String? message;

  HomeProductsError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message,];

}