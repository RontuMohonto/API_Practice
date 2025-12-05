import 'dart:developer';
import 'package:http/http.dart' as http;

class AddApi {
  static Future<void> storeData() async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/1");

    } catch (e) {
      log("===${e}=");
    }
  }
}
