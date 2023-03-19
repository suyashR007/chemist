// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'chemist_model.g.dart';

@HiveType(typeId: 0)
class ChemistModel extends HiveObject {
  @HiveField(0)
  String? chemistCode;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? location;
  @HiveField(3)
  String? mobile;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? mcrNo;
  @HiveField(6)
  String? lastMonthrcpa;
  @HiveField(7)
  String? lastrcpaDate;

  ChemistModel({
    this.chemistCode,
    this.name,
    this.location,
    this.mobile,
    this.email,
    this.mcrNo,
    this.lastMonthrcpa,
    this.lastrcpaDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chemist_code': chemistCode,
      'name': name,
      'location': location,
      'mobile': mobile,
      'email': email,
      'mcr_no': mcrNo,
      'last_month_rcpa': lastMonthrcpa,
      'last_rcpa_date': lastrcpaDate,
    };
  }

  factory ChemistModel.fromMap(Map<String, dynamic> map) {
    return ChemistModel(
      chemistCode:
          map['chemist_code'] != null ? map['chemist_code'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mcrNo: map['mcr_no'] != null ? map['mcr_no']!.toString() : null,
      lastMonthrcpa: map['last_month_rcpa'] != null
          ? map['last_month_rcpa']!.toString()
          : null,
      lastrcpaDate: map['last_rcpa_date'] != null
          ? map['last_rcpa_date'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChemistModel.fromJson(source) =>
      ChemistModel.fromMap(source as Map<String, dynamic>);
}
