import 'package:get/get.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/product_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var producBestList = <Product>[].obs;
  var producMoneyList = <Product>[].obs;
  var producCategoryList = <Product>[].obs;
  RxList<Product> producList = <Product>[].obs;

  var loading = true.obs;
  RxString errorMessage = ''.obs;

  RxList<Product> getProductList(String? option, String? category) {
    if (option != null) {
      switch (option) {
        case 'BEST':
          return producBestList;
        case 'MONEY':
          return producMoneyList;
        default:
          return producBestList;
      }
    } else if (category != null) {
      return producCategoryList;
    }

    return producBestList;
  }

  Future<List<Product>?> fetchProductList(
    String? category,
    String? country,
    String? displayCategory,
    String? orderBy,
    String? option,
    bool? money,
    int? maxPrice,
    int? minPrice,
  ) async {
    var url = '';
    if (option != null) {
      url = '$url?option=$option';
    } else if (category != null) {
      url = '$url/category?category=$category';
    } else if (country != null) {
      url = '$url/country?country=$country';
    } else if (money == true) {
      url = '$url/money';
      if (maxPrice != null && minPrice != null) {
        url = '$url?maxPrice=$maxPrice&minPrice=$minPrice';
      } else if (maxPrice != null) {
        url = '$url?maxPrice=$maxPrice';
      } else if (minPrice != null) {
        url = '$url?minPrice=$minPrice';
      }
    }
    if (orderBy != null) {
      url = '$url&orderBy=$orderBy';
    } else {
      url = '$url&orderBy=MOST';
    }

    print(url);
    var products = await ProductServices.fetchProducts(url);
    return products;
  }
}
