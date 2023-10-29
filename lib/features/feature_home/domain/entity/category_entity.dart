import 'package:equatable/equatable.dart';

import '../../data/models/Category_model.dart';

class CategoryEntity extends Equatable
{
  String? status;
  List<Categories> ?categories;

  CategoryEntity({
    this.status,
    this.categories
});
  @override
  // TODO: implement props
  List<Object?> get props => [status,categories];

}