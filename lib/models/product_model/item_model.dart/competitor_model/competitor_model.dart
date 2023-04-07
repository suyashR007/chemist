import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'competitor_model.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 4)
class CompetatiorModel extends HiveObject {
  @HiveField(0)
  String? productName;
  @HiveField(1)
  String? productCode;
  @HiveField(2)
  String? compProductCode;
  @HiveField(3)
  String? compProductName;
  @HiveField(4)
  String? comapnyName;
  @HiveField(5)
  String? companyCode;
  CompetatiorModel({
    this.productName,
    this.productCode,
    this.compProductCode,
    this.compProductName,
    this.comapnyName,
    this.companyCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_name': productName,
      'product_code': productCode,
      'comp_product_code': compProductCode,
      'comp_product_name': compProductName,
      'company_name': comapnyName,
      'company_code': companyCode,
    };
  }

  factory CompetatiorModel.fromMap(Map<String, dynamic> map) {
    return CompetatiorModel(
      productName:
          map['product_name'] != null ? map['product_name'] as String : null,
      productCode:
          map['product_code'] != null ? map['product_code'] as String : null,
      compProductCode: map['comp_product_code'] != null
          ? map['comp_product_code'] as String
          : null,
      compProductName: map['comp_product_name'] != null
          ? map['comp_product_name'] as String
          : null,
      comapnyName:
          map['company_name'] != null ? map['company_name'] as String : null,
      companyCode:
          map['company_code'] != null ? map['company_code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompetatiorModel.fromJson(String source) =>
      CompetatiorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
