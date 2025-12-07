import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddApi {
  static Future<void> storeData({
    required String quote,
    required String author,
  }) async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations");
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = {"category_id": "3", "quote": quote, "author": author};
      var r = await http.post(url, headers: header, body: jsonEncode(body));
      log("===Status: ${r.statusCode}====");
      log("===Response: ${r.body}====");
    } catch (error) {
      log("===Error: $error===");
    }
  }
}
