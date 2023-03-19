import 'package:chemist/providers/homepage_provider/repository/home_repository_impl.dart';
import 'package:flutter/material.dart';
import '../../models/chemist_model/chemist_model.dart';

class HomePageProvider with ChangeNotifier {
  final HomePageRepositoryImpl _repositoryImpl = HomePageRepositoryImpl();
  List<ChemistModel> chemistList = [];

  Future<void> fetchChemistDetail() async {
    chemistList = await _repositoryImpl.getChemistList();
  }
}
