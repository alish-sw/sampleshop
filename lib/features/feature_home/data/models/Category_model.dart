import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';



class CategoryModel extends CategoryEntity{
  CategoryModel({
    String? status,
    List<Categories> ?categories,
  }):super(
    status: status,
    categories: categories
  );

  CategoryModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Categories {
  Categories({
    this.id,
    this.name,
    this.icon,
    this.draft,
    this.brief,
    this.color,
    this.priority,
    this.createdAt,
    this.lastUpdate,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    draft = json['draft'];
    brief = json['brief'];
    color = json['color'];
    priority = json['priority'];
    createdAt = json['created_at'];
    lastUpdate = json['last_update'];
  }
  int? id;
  String ?name;
  String? icon;
  int ?draft;
  String ?brief;
  String? color;
  int? priority;
  int? createdAt;
  int? lastUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['draft'] = draft;
    map['brief'] = brief;
    map['color'] = color;
    map['priority'] = priority;
    map['created_at'] = createdAt;
    map['last_update'] = lastUpdate;
    return map;
  }

}