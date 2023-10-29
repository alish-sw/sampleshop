
import 'package:equatable/equatable.dart';
import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';

abstract class HomeCategoryStatus extends Equatable{}


class HomeCategoryLoading extends HomeCategoryStatus
{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeCategoryCompleted extends HomeCategoryStatus
{
  final CategoryEntity categoryEntity;
  HomeCategoryCompleted(this.categoryEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [categoryEntity];
}
class HomeCategoryError extends HomeCategoryStatus
{
  final String ? message;
  HomeCategoryError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}