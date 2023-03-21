// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:chemist/models/product_model/item_model.dart/competitor_model/competitor_model.dart';

@HiveType(typeId: 2)
class ItemsModel extends HiveObject {
  String? productName;
  String? productCode;
  String? mktRate;
  List<CompetatiorModel?>? competatiorModel;
  ItemsModel({
    this.productName,
    this.productCode,
    this.mktRate,
    this.competatiorModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productCode': productCode,
      'mktRate': mktRate,
      'competitors': competatiorModel!.map((x) => x?.toMap()).toList(),
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      productName:
          map['product_name'] != null ? map['product_name'] as String : null,
      productCode:
          map['product_code'] != null ? map['product_code'] as String : null,
      mktRate: map['mkt_rate'] != null ? map['mkt_rate']!.toString() : null,
      competatiorModel: map['competitors'] != null
          ? List<CompetatiorModel?>.from(
              (map['competitors'] as List<dynamic>).map<CompetatiorModel?>(
                (x) => CompetatiorModel?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
