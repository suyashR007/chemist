import 'package:chemist/models/product_model/product_model.dart';
import 'package:chemist/providers/homepage_provider/repository/home_repository_impl.dart';
import 'package:flutter/material.dart';
import '../../models/chemist_model/chemist_model.dart';

class HomePageProvider with ChangeNotifier {
  bool isLoading = false;
  final HomePageRepositoryImpl _repositoryImpl = HomePageRepositoryImpl();
  List<ChemistModel> chemistList = [];
  List<ProductModel> productList = [];
  List<ChemistModel> foundChemist = [];

  void isLoadingFn() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> runFilter(String val) async {
    List<ChemistModel> result = [];
    if (val.isEmpty) {
      result = chemistList;
    } else {
      result = chemistList.where((element) {
        return element.name!.toLowerCase().contains(val.toLowerCase());
      }).toList();
    }

    foundChemist = result;
    notifyListeners();
  }

  Future<void> fetchChemistDetail() async {
    isLoadingFn();
    chemistList = await _repositoryImpl.getChemistList();
    productList = await _repositoryImpl.getProductList();
    isLoadingFn();
    notifyListeners();
  }
}
