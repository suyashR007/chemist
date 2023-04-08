import 'package:chemist/models/table_models/table_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TablePageProvider with ChangeNotifier {
  List<TableModel> models = [];

  Future<void> saveDetails(
    TableModel model,
  ) async {
    var box = await Hive.openBox<TableModel>('tablelist');
    int lenght = box.length;
    model.orderNo = (++lenght).toString();
    box.add(model);
  }

  Future<List<TableModel>> getaTableList() async {
    try {
      var box = await Hive.openBox<TableModel>('tablelist');
      int length = box.length;
      if (length > 0) {
        for (int i = 0; i < length; i++) {
          models.add(box.getAt(i)!);
        }
      }
      return models;
    } catch (e) {
      return [];
    }
  }
}
