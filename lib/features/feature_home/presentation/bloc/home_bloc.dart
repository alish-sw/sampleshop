import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navasan/features/feature_home/presentation/bloc/home_category_status.dart';
import 'package:navasan/features/feature_home/presentation/bloc/home_products_state.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/use_cases/get_all_category_usecase.dart';
import '../../domain/use_cases/get_all_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  ///add your usecases
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoryUseCase _getAllCategoryUseCase;
  HomeBloc(this._getAllProductsUseCase,this._getAllCategoryUseCase) : super(HomeState(homeProductsState:HomeProductsLoading(),homeCategoryStatus:HomeCategoryLoading())){
    on<HomeProductEvent>((event, emit) async {

      emit(state.copyWith(newHomeProductsState: HomeProductsLoading()));
      DataState dataState = await _getAllProductsUseCase(event.productName);

      if(dataState is DataSuccess){
        emit(state.copyWith(newHomeProductsState: HomeProductsCompleted(dataState.data)));
      }

      /// emit State to Error for just Fw
      if(dataState is DataFailed){
        emit(state.copyWith(newHomeProductsState: HomeProductsError(dataState.error)));
      }

    });
    on<HomeCategoryEvent>((event,emit) async{
      emit(state.copyWith(newHomeCategoryStatus:HomeCategoryLoading()));
      DataState dState=await _getAllCategoryUseCase(NoParams());
      if(dState is DataSuccess)
        {
          emit(state.copyWith(newHomeCategoryStatus:HomeCategoryCompleted(dState.data)));
        }
      if(dState is DataFailed)
        {
          emit(state.copyWith(newHomeCategoryStatus: HomeCategoryError(dState.error)));
        }
        });
    }
  }

