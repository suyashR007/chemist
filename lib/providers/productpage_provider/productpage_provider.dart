import 'dart:io';
import 'package:chemist/models/chemist_model/chemist_model.dart';
import 'package:chemist/models/product_model/product_model.dart';
import 'package:chemist/models/table_model/table_model.dart';
import 'package:chemist/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProductPageProvider with ChangeNotifier {
  bool isLoading = false;

  List<ProductModel>? productList;
  ProductPageProvider({this.productList});
  int counter = 0;
  late ProductModel selectedModel = productList![0];
  File? imageFile;
  TableModel? tableModel;
  ChemistModel? chemistModel;

  isLoadingFn() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getChemistModel(ChemistModel mod) {
    chemistModel = mod;
  }

  counterAdd() {
    counter++;
    notifyListeners();
  }

  counterSub() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  changeSelectedModel(ProductModel e) {
    selectedModel = e;
    notifyListeners();
  }

  Future pickImage(BuildContext context) async {
    try {
      isLoadingFn();
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      isLoadingFn();
      if (image == null) return;
      final imageTemp = File(image.path);
      imageFile = imageTemp;
      notifyListeners();
    } on PlatformException catch (e) {
      isLoadingFn();
      showMySnackBar(context, 'Failed to Pick Image:$e');
    }
  }

  saveDetailButton() async {
    tableModel!.chemistName = chemistModel!.name;
    tableModel!.productDetails = selectedModel.brandName;
  }
}
