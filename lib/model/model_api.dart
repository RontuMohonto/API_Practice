import 'package:http/http.dart' as http;

class API {
  void GetDataFromAPI ()async{
     var url = Uri.parse("https://appapi.coderangon.com/api/names/A");
     var response = await http.get(url);
  }
}
