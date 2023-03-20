import 'package:chemist/models/product_model/item_model.dart/items_model.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  String? brandCode;
  String? brandName;
  List<ItemsModel?>? itemsModel;
}
