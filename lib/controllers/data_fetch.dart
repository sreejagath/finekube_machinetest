import 'package:finekube_machinetest/controllers/dynamics/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataFetch {
  Future fetchData(String pageNumber) async {
    final response = await http.get(Uri.parse(baseUrl + other + pageNumber));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
