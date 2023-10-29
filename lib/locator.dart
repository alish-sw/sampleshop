import 'package:get_it/get_it.dart';
import 'package:navasan/features/feature_home/data/repository/home_repositoryimp.dart';
import 'package:navasan/features/feature_home/domain/repository/home_repository.dart';
import 'package:navasan/features/feature_home/domain/use_cases/get_all_category_usecase.dart';
import 'package:navasan/features/feature_home/domain/use_cases/get_all_products_usecase.dart';
import 'package:navasan/features/feature_product_detail/data/data_source/remote/product_api_provider.dart';
import 'package:navasan/features/feature_product_detail/data/repository/product_detail_repository_imp.dart';
import 'package:navasan/features/feature_product_detail/domain/repository/product_detail_repository.dart';
import 'package:navasan/features/feature_product_detail/domain/use_cases/get_all_product_images_usecase.dart';
import 'package:navasan/features/feature_product_detail/domain/use_cases/get_product_detail_usecase.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/products_detail_bloc.dart';

import 'core/bloc/bottom_icon_cubit.dart';
import 'features/feature_authentication/data/data_source/local/auth_local_data.dart';
import 'features/feature_authentication/data/data_source/remote/auth_api_provider.dart';
import 'features/feature_authentication/data/repository/AuthRepositoryImp.dart';
import 'features/feature_authentication/domain/repository/auth_repository.dart';
import 'features/feature_authentication/domain/use_cases/authentication_user_usecase.dart';
import 'features/feature_authentication/domain/use_cases/load_user_profile_usecase.dart';
import 'features/feature_authentication/domain/use_cases/login_user_usecase.dart';
import 'features/feature_authentication/presentation/bloc/auth_bloc.dart';
import 'features/feature_home/data/data_source/remote/api_provider.dart';
import 'features/feature_home/domain/use_cases/get_suggest_products_usecase.dart';
import 'features/feature_home/presentation/bloc/home_bloc.dart';


GetIt locator = GetIt.instance;

Future<void> setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<ProductApiProvider>(ProductApiProvider());
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider());
  locator.registerSingleton<AuthLocalData>(AuthLocalData());
  //final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //locator.registerSingleton<AppDatabase>(database);

  // inject Repositories
  locator.registerSingleton<HomeRepository>(HomeRepositoryImp(locator()));
  locator.registerSingleton<ProductDetailRepository>(ProductDetailrepositoryImp(locator()));
  locator.registerSingleton<AuthRepository>(AuthRepositoryImp(locator(),locator()));
  // inject UseCases
  locator.registerSingleton<GetAllProductsUseCase>(GetAllProductsUseCase(locator()));
  locator.registerSingleton<GetAllCategoryUseCase>(GetAllCategoryUseCase(locator()));
  locator.registerSingleton<GetSuggestProductsUseCase>(GetSuggestProductsUseCase(locator()));
  locator.registerSingleton<GetProductDetailUseCase>(GetProductDetailUseCase(locator()));
  locator.registerSingleton<GetAllProductImagesUseCase>(GetAllProductImagesUseCase(locator()));
  locator.registerSingleton<LoginUserUseCase>(LoginUserUseCase(locator()));
  locator.registerSingleton<AuthenticationUserUseCase>(AuthenticationUserUseCase(locator()));
  locator.registerSingleton<LoadUserProfileUseCase>(LoadUserProfileUseCase(locator()));
  //
  locator.registerSingleton<HomeBloc>(HomeBloc(locator(),locator()));
  locator.registerSingleton<ProductsDetailBloc>(ProductsDetailBloc(locator(),locator()));
  locator.registerSingleton<AuthBloc>(AuthBloc(locator(),locator(),locator()));
  locator.registerSingleton<BottomIconCubit>(BottomIconCubit());
  // locator.registerLazySingleton<Dio>(() => Dio());

// Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<AppModel>(AppModel());
}