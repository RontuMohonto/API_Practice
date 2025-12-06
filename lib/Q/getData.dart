import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class APIdata {
  Future<Map> getData() async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/3");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        return {};
      }
    } catch (e) {
      log("=====Error : $e==");
    }
    return {};
  }
}
