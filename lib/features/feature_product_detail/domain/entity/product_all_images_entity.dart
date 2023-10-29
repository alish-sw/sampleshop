import 'package:equatable/equatable.dart';

import '../../data/models/ProductAllImagesModel.dart';

class ProductAllImgaesEntity extends Equatable
{
  List<Productimages>? productimages;
  ProductAllImgaesEntity({this.productimages});

  @override
  // TODO: implement props
  List<Object?> get props =>[productimages];

}
