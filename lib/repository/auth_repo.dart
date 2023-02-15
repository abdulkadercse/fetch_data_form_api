import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class AuthRepo {

  // get data
  Future<ProductModel> getData() async {
    var response = await http.get(Uri.parse(
        "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Something wrong, please try again");
    }
  }
}
