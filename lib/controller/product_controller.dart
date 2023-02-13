import 'package:get/get.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/product_service.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var productList = <Product>[].obs;
  var loading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var products = await ProductServices.fetchProducts();

    if (products != null) {
      productList.value = products;
    }
    loading.value = false;
  }
}
