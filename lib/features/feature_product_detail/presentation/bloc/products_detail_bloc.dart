import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navasan/core/resources/data_state.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/product_detail_status.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/products_all_images_status.dart';

import '../../domain/use_cases/get_all_product_images_usecase.dart';
import '../../domain/use_cases/get_product_detail_usecase.dart';

part 'products_detail_event.dart';
part 'products_detail_state.dart';

class ProductsDetailBloc extends Bloc<ProductsDetailEvent, ProductsDetailState> {
  final GetProductDetailUseCase _getProductDetailUseCase;
  final GetAllProductImagesUseCase _getAllProductImagesUseCase;
  ProductsDetailBloc(this._getProductDetailUseCase,this._getAllProductImagesUseCase) : super(ProductsDetailState(productDetailStatus: ProductDetailLoading(), productAllImagesStatus: ProductAllImagesLoading())) {
    on<ProductDetailEvents>((event, emit) async {
      emit(state.copyWith(newProductDetailStatus: ProductDetailLoading()));
      DataState dataState = await _getProductDetailUseCase(event.productId);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newProductDetailStatus: ProductDetailCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newProductDetailStatus: ProductDetailError(dataState.error!)));
      }
    });
    on<ProductAllImagesEvents>((event, emit) async {
      emit(state.copyWith(newProductsAllImagesStatus: ProductAllImagesLoading()));
      DataState dataState = await _getAllProductImagesUseCase(event.productId);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newProductsAllImagesStatus: ProductsAllImagesCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newProductsAllImagesStatus: ProductsAllImagesError(dataState.error!)));
      }
    });
  }
  dispose()
  {
    _getAllProductImagesUseCase.dispose();
  }
}
