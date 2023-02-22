import 'package:get/get.dart';
import 'package:valt/model/youtube_model.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeController extends GetxController {
  static YoutubeController get to => Get.find();
  var youtubeHomeList = <YoutubeModel>[
    YoutubeModel(
        title: "초보자에게 추천하는 가성비 좋은 블렌디드와 싱글몰트 위스키!! | 주락이월드 / 14F",
        authorName: "14F 일사에프",
        thumbnailUrl: "https://i.ytimg.com/vi/8rDWHUfEhdk/hqdefault.jpg",
        youtubeLink: 'https://youtu.be/8rDWHUfEhdk'),
    YoutubeModel(
        title: "위스키는 왜 알고 마셔야 할까",
        authorName: "셜록현준",
        thumbnailUrl: "https://i.ytimg.com/vi/GE5Ik9OX8lY/hqdefault.jpg",
        youtubeLink: "https://www.youtube.com/watch?v=GE5Ik9OX8lY"),
    YoutubeModel(
        title: "NOPUBLIC EP1] 위스키를 알고 싶다면?  위스키 입문의 모든것! Whisky알고 즐기자~",
        authorName: "노퍼블릭",
        thumbnailUrl: "https://i.ytimg.com/vi/Z1ZSZdVEWdI/hqdefault.jpg",
        youtubeLink: "https://www.youtube.com/watch?v=Z1ZSZdVEWdI"),
    YoutubeModel(
        title: "위스키 초보 입문 가이드! / 입문용 위스키 추천, 알면 도움이 되는 위스키 상식까지, 이 영상 하나면 끝",
        authorName: "술익는집 Drinkhouse",
        thumbnailUrl: "https://i.ytimg.com/vi/FtemVq2qyco/hqdefault.jpg",
        youtubeLink: "https://www.youtube.com/watch?v=FtemVq2qyco"),
    YoutubeModel(
        title:
            "위스키 초보자를 위한 위스키 입문 가이드! 위스키 종류와 용어, 마시는 법, 하이볼, 어울리는 안주와 구매하는 방법 간단 정리",
        authorName: "위안의 시간- Whisky & Foods",
        thumbnailUrl: "https://i.ytimg.com/vi/7hJN-BCApgc/hqdefault.jpg",
        youtubeLink: "https://www.youtube.com/watch?v=7hJN-BCApgc")
  ].obs;
  var referenceYoutubeList = <YoutubeModel>[].obs;
  var loading = true.obs;
  RxString errorMessage = ''.obs;

  Future<void> youtubeLaunchUrl(String youtubeLink) async {
    final Uri url = Uri.parse(youtubeLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

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
