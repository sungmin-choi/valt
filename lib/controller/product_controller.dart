import 'package:get/get.dart';
import 'package:valt/model/product.dart';
import 'package:valt/model/products.dart';
import 'package:valt/service/network_handler/product_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();

  var producBestList = <Product>[].obs;
  var producMoneyList = <Product>[].obs;
  var producCategoryList = <Product>[].obs;
  RxList<Product> productList = <Product>[].obs;
  RxList<Product> dibsProductList = <Product>[].obs;

  var loading = true.obs;
  RxString errorMessage = ''.obs;

  get client => null;

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

  Future<Products?> fetchDibsProductList(int? size, int? page) async {
    var url = '/like?';
    if (page != null) {
      url = '$url&page=$page';
    }
    if (size != null) {
      url = '$url&size=$size';
    }

    var products = await ProductServices.fetchProducts(url);

    return products;
  }

  Future<Products?> fetchProductList(
      String? category,
      String? country,
      String? displayCategory,
      String? orderBy,
      String? option,
      bool? money,
      int? maxPrice,
      int? minPrice,
      int? size,
      int? page) async {
    var url = '';
    if (displayCategory != null) {
      url = '/displayCategory?displayCategory=$displayCategory';
    }

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
    if (page != null) {
      url = '$url&page=$page';
    }
    if (size != null) {
      url = '$url&size=$size';
    }

    var products = await ProductServices.fetchProducts(url);
    return products;
  }
}
