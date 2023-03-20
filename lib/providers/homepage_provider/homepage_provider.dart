import 'package:chemist/providers/homepage_provider/repository/home_repository_impl.dart';
import 'package:flutter/material.dart';
import '../../models/chemist_model/chemist_model.dart';

class HomePageProvider with ChangeNotifier {
  bool isLoading = false;
  final HomePageRepositoryImpl _repositoryImpl = HomePageRepositoryImpl();
  List<ChemistModel> chemistList = [];

  void isLoadingFn() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchChemistDetail() async {
    isLoadingFn();
    chemistList = await _repositoryImpl.getChemistList();
    isLoadingFn();
    notifyListeners();
  }
}
