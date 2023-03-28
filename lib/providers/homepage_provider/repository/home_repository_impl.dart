import 'dart:convert';
import 'package:chemist/global/http.dart';
import 'package:chemist/models/product_model/product_model.dart';
import '../../../models/chemist_model/chemist_model.dart';

class HomePageRepositoryImpl {
  HttpClient client = HttpClient();
  Future<List<ChemistModel>> getChemistList() async {
    try {
      final resp = await client
          .get('contact/chemist?sbu_code=04&company_code=1000&rep_code=44149');
      return (json.decode(resp.body) as List).map((e) {
        return ChemistModel.fromJson(e);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ProductModel>> getProductList() async {
    final resp = await client.get(
        'Getproductbrandmapping?month=1&year=2019&sbu_code=26&rep_code=67953');
    return (json.decode(resp.body) as List).map((e) {
      return ProductModel.fromJson(e);
    }).toList();
  }
}
