import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse(
      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json");
  var response = await http.get(url);

  print(response.body);
}
