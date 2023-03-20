import 'package:chemist/models/product_model/item_model.dart/competitor_model/competitor_model.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class ItemsModel extends HiveObject {
  String? productName;
  String? productCode;
  String? mktRate;
  List<CompetatiorModel?>? competatiorModel;
}
