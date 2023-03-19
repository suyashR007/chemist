import 'dart:convert';
import 'package:chemist/global/http.dart';
import '../../../models/chemist_model/chemist_model.dart';

class HomePageRepositoryImpl {
  Future<List<ChemistModel>> getChemistList() async {
    HttpClient client = HttpClient();
    final resp = await client
        .get('contact/chemist?sbu_code=04&company_code=1000&rep_code=44149');
    return (json.decode(resp.body) as List).map((e) {
      return ChemistModel.fromJson(e);
    }).toList();
  }
}
