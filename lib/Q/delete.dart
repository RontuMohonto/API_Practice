import 'dart:developer';

import 'package:http/http.dart' as http;

class DeleteQuote {
  static Future<void> deleteFun({required String id}) async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/$id");
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        log("==Success==");
      }
    } catch (e) {
      log("===${e}=");
    }
  }
}
