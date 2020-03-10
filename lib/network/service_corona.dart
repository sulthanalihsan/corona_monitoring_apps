import 'dart:convert';

import 'package:coronamonitorapps/models/response_corona.dart';
import 'package:coronamonitorapps/models/response_detail_corona.dart';
import 'package:http/http.dart' as http;

class ServiceCorona {
  static final String _baseUrl = 'https://covid19.mathdro.id/api';
  static final String _confirmedUrl = 'https://covid19.mathdro.id/api/confirmed';

  Future<ResponseCorona> getDataMain() async {
    final response = await http.get(_baseUrl);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ResponseCorona data = ResponseCorona.fromJson(json);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ResponseDetailCorona>> getDetailCorona() async {
    final response = await http.get(_confirmedUrl);

    if (response.statusCode == 200) {
//      final json = jsonDecode(response.body);
      List<ResponseDetailCorona> data = responseDetailCoronaFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ResponseDetailCorona>> getDetailAllCorona(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
//      final json = jsonDecode(response.body);
      List<ResponseDetailCorona> data = responseDetailCoronaFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
