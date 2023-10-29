import 'package:equatable/equatable.dart';

import '../../data/models/Productsmodel.dart';

class ProductsEntity extends Equatable
{
  String? status;
  int ?count;
  int? countTotal;
  int ?pages;
  List<Products>? products;
  ProductsEntity({
      this.status,
      this.count,
      this.countTotal,
      this.pages,
      this.products
    });

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    count,
    countTotal,
    pages,
    products
  ];

  @override
  bool get stringify => true;

}