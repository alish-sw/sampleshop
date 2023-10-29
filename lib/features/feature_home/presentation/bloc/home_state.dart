part of 'home_bloc.dart';

@immutable
 class HomeState extends Equatable {
 HomeProductsState homeProductsState;
 HomeCategoryStatus homeCategoryStatus;

 HomeState({required this.homeProductsState,required this.homeCategoryStatus});


 HomeState copyWith({HomeProductsState?newHomeProductsState,HomeCategoryStatus?newHomeCategoryStatus}){
  return HomeState(
   homeProductsState: newHomeProductsState ?? homeProductsState,
      homeCategoryStatus: newHomeCategoryStatus??homeCategoryStatus,
  );
 }

  @override
  // TODO: implement props
  List<Object?> get props =>[
      homeProductsState,
      homeCategoryStatus
  ];

}


