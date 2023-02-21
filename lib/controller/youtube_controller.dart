import 'package:get/get.dart';
import 'package:valt/model/youtube_model.dart';

class YoutubeController extends GetxController {
  static YoutubeController get to => Get.find();
  var youtubeHomeList = <YoutubeModel>[].obs;
  var referenceYoutubeList = <YoutubeModel>[].obs;
  var loading = true.obs;
  RxString errorMessage = ''.obs;

  RxList<YoutubeModel> getProductList(String page) {
    switch (page) {
      case 'HOME':
        return youtubeHomeList;
      case 'DETAIL':
        return referenceYoutubeList;
      default:
        return youtubeHomeList;
    }
  }
}
