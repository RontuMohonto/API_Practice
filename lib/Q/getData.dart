import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class APIdata {
  Future<Map> getData() async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log("=====Error : $e==");
    }
    return {};
  }
}
