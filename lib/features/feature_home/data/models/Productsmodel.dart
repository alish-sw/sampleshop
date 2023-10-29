

import '../../domain/entity/products_entitiy.dart';

class Productsmodel extends ProductsEntity
{
  Productsmodel({
    String? status,
    int ?count,
    int? countTotal,
    int ?pages,
    List<Products>? products,}):super(
    status: status,
    count: count,
    countTotal: countTotal,
    pages: pages,
    products: products
  );

  Productsmodel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    countTotal = json['count_total'];
    pages = json['pages'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    map['count_total'] = countTotal;
    map['pages'] = pages;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Products {
  Products({
    this.id,
    this.name,
    this.image,
    this.price,
    this.stock,
    this.draft,
    this.status,
    this.createdAt,
    this.lastUpdate,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
    draft = json['draft'];
    status = json['status'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
  }
  int? id;
  String? name;
  String? image;
  int? price;
  int ?stock;
  int ?draft;
  String ?status;
  int? createdAt;
  int ?lastUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['stock'] = stock;
    map['draft'] = draft;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['last_update'] = lastUpdate;
    return map;
  }

}