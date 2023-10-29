part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductEvent extends HomeEvent {
  final String productName;
  HomeProductEvent(this.productName);
}

class HomeCategoryEvent extends HomeEvent
{
  HomeCategoryEvent();
}