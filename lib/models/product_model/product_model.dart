// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:chemist/models/product_model/item_model.dart/items_model.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  String? brandCode;
  @HiveField(1)
  String? brandName;
  @HiveField(2)
  List<ItemsModel?>? itemsModel;
  ProductModel({
    this.brandCode,
    this.brandName,
    this.itemsModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand_code': brandCode,
      'brand_name': brandName,
      'items': itemsModel!.map((x) => x?.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      brandCode: map['brand_code'] != null ? map['brand_code'] as String : null,
      brandName: map['brand_name'] != null ? map['brand_name'] as String : null,
      itemsModel: map['items'] != null
          ? List<ItemsModel?>.from(
              (map['items'] as List<dynamic>).map<ItemsModel?>(
                (x) => ItemsModel?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(source) =>
      ProductModel.fromMap(source as Map<String, dynamic>);
}
