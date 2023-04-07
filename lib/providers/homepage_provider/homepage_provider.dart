import 'package:chemist/models/product_model/product_model.dart';
import 'package:chemist/providers/homepage_provider/repository/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/chemist_model/chemist_model.dart';
import '../../screens/add_product.dart';
import '../../utils/helpers.dart';

class HomePageProvider with ChangeNotifier {
  bool isLoading = false;
  final HomePageRepositoryImpl _repositoryImpl = HomePageRepositoryImpl();
  List<ChemistModel> _chemistList = [];
  List<ProductModel> productList = [];
  List<ChemistModel> foundChemist = [];

  int get chemistListLenght => _chemistList.length;
  DateTime get now => DateTime.now();

  void isLoadingFn() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<int> getTotalChemist() async {
    var box = await Hive.openBox<ChemistModel>('chemistList');
    return box.length;
  }

  Future<void> runFilter(
    String val,
    void Function(void Function()) setState,
  ) async {
    List<ChemistModel> result = [];
    if (val.isEmpty) {
      result = _chemistList;
    } else {
      result = _chemistList.where((element) {
        return element.name!.toLowerCase().contains(val.toLowerCase());
      }).toList();
    }
    setState(
      () {
        foundChemist = result;
        notifyListeners();
      },
    );
  }

  void listTileTapFn(int index, BuildContext context) {
    goToPage(context, AddProductPage(model: foundChemist[index]));
    notifyListeners();
  }

  Future<void> fetchChemistDetail() async {
    isLoadingFn();
    var box = await Hive.openBox<ChemistModel>('chemistList');
    var box2 = await Hive.openBox<ProductModel>('productlist');
    if (_chemistList.isEmpty) {
      _chemistList = await _repositoryImpl.getChemistList();
      for (ChemistModel element in _chemistList) {
        box.put(element.chemistCode, element);
      }
    }
    if (productList.isEmpty) {
      productList = await _repositoryImpl.getProductList();
      for (ProductModel element in productList) {
        box2.put(element.brandCode, element);
      }
    }
    foundChemist = _chemistList;
    isLoadingFn();
    notifyListeners();
  }
}
