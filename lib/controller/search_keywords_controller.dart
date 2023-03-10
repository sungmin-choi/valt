import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/product_service.dart';

class SearchKeywordsController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxList<Product> producList = <Product>[].obs;

  void fetchProductList(String? searchText, String? orderBy) async {
    if (searchText != null) {
      if (orderBy != null) {
        var products = await ProductServices.fetchProducts(
            '/search?orderBy=$orderBy&searchText=$searchText');
        if (products != null) producList.value = products;
      } else {
        var products = await ProductServices.fetchProducts(
            '/search?orderBy=MOST&searchText=$searchText');
        if (products != null) producList.value = products;
      }
    } else {
      producList.value = [];
    }
  }
}
