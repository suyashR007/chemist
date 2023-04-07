// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'table_model.g.dart';

@HiveType(typeId: 5)
class TableModel extends HiveObject {
  @HiveField(0)
  String? dateTime;
  @HiveField(1)
  String? orderNo;
  @HiveField(2)
  String? chemistName;
  @HiveField(3)
  String? productDetails;
  @HiveField(4)
  String? status;

  TableModel({
    this.dateTime,
    this.orderNo,
    this.chemistName,
    this.productDetails,
    this.status,
  });

  TableModel copyWith({
    String? dateTime,
    String? orderNo,
    String? chemistName,
    String? productDetails,
    String? status,
  }) {
    return TableModel(
      dateTime: dateTime ?? this.dateTime,
      orderNo: orderNo ?? this.orderNo,
      chemistName: chemistName ?? this.chemistName,
      productDetails: productDetails ?? this.productDetails,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime,
      'orderNo': orderNo,
      'chemistName': chemistName,
      'productDetails': productDetails,
      'status': status,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      orderNo: map['orderNo'] != null ? map['orderNo'] as String : null,
      chemistName:
          map['chemistName'] != null ? map['chemistName'] as String : null,
      productDetails: map['productDetails'] != null
          ? map['productDetails'] as String
          : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModel.fromJson(String source) =>
      TableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TableModel(dateTime: $dateTime, orderNo: $orderNo, chemistName: $chemistName, productDetails: $productDetails, status: $status)';
  }

  @override
  bool operator ==(covariant TableModel other) {
    if (identical(this, other)) return true;

    return other.dateTime == dateTime &&
        other.orderNo == orderNo &&
        other.chemistName == chemistName &&
        other.productDetails == productDetails &&
        other.status == status;
  }

  @override
  int get hashCode {
    return dateTime.hashCode ^
        orderNo.hashCode ^
        chemistName.hashCode ^
        productDetails.hashCode ^
        status.hashCode;
  }
}
