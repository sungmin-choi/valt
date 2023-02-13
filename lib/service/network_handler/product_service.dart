import 'package:http/http.dart' as http;
import 'package:valt/model/product.dart';

class ProductServices {
  static var client = http.Client();

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(buildUrl('/items'), headers: {
      "Content-type": "application/json",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jasonData = response.body;
      return productFromJson(jasonData);
    } else {
      return null;
    }
  }
}
