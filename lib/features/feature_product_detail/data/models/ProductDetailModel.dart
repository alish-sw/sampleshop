import '../../domain/entity/product_detail_entity.dart';

class ProductDetailModel extends ProductDetailEntity {

  ProductDetailModel({
    int ?id,
    String ?name,
    String ?image,
    int ?price,
    int ?stock,
    int ?draft,
    String ?description,
    String ?status,
    int ?createdAt,
    int ?lastUpdate,}):super(
    id: id,
    name: name,
    image: image,
    price: price,
    stock: stock,
    draft: draft,
    description: description,
    status: status,
    createdAt: createdAt,
    lastUpdate: lastUpdate
  );

  ProductDetailModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
    draft = json['draft'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['stock'] = stock;
    map['draft'] = draft;
    map['description'] = description;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['last_update'] = lastUpdate;
    return map;
  }

}