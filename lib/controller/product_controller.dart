import 'package:get/get.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/product_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var producBestList = <Product>[].obs;
  var producMoneyList = <Product>[].obs;
  var producCategoryList = <Product>[].obs;
  var loading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBestData();
    fetchMoneyData();
  }

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

  void fetchBestData() async {
    var products = await ProductServices.fetchProducts('?option=BEST');

    if (products != null) {
      producBestList.value = products;
    }
    loading.value = false;
  }

  void fetchMoneyData() async {
    var products = await ProductServices.fetchProducts('?option=MONEY');

    if (products != null) {
      producMoneyList.value = products;
    }
    loading.value = false;
  }

  void fetchCategoryData(String category) async {
    var products = await ProductServices.fetchProducts('?categor=$category');

    if (products != null) {
      producCategoryList.value = products;
    }
    loading.value = false;
  }
}
