import '../../domain/entity/product_all_images_entity.dart';


class ProductAllImagesModel extends ProductAllImgaesEntity {
  List<Productimages>? productimages;
  ProductAllImagesModel({
      required this.productimages,}):super(
    productimages: productimages
  );

  ProductAllImagesModel.fromJson(dynamic json) {
    if (json['productimages'] != null) {
      productimages = [];
      json['productimages'].forEach((v) {
        productimages?.add(Productimages.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productimages != null) {
      map['productimages'] = productimages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Productimages {
  int ?productId;
  String? name;
  Productimages({
    this.productId,
    this.name,});

  Productimages.fromJson(dynamic json) {
    productId = json['product_id'];
    name = json['name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['name'] = name;
    return map;
  }

}