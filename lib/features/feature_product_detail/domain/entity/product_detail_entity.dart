import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable
{
  int ?id;
  String ?name;
  String ?image;
  int ?price;
  int ?stock;
  int ?draft;
  String ?description;
  String ?status;
  int ?createdAt;
  int ?lastUpdate;
  ProductDetailEntity({
    this.id,
    this.name,
    this.image,
    this.price,
    this.stock,
    this.draft,
    this.description,
    this.status,
    this.createdAt,
    this.lastUpdate,});
  @override
  // TODO: implement props
  List<Object?> get props => [
  id,
  name,
  image,
  price,
  stock,
  draft,
  description,
  status,
  createdAt,
  lastUpdate,
  ];

}