import 'package:flutter/material.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/model/youtube_model.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';

class YoutubeTile extends StatelessWidget {
  var controller = Get.find<YoutubeController>();

  final YoutubeModel youtubeModel;
  final String? page;
  YoutubeTile({super.key, required this.youtubeModel, this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.youtubeLaunchUrl(youtubeModel.youtubeLink);
      },
      child: Flexible(
        fit: FlexFit.tight,
        // width: page == 'detail' ? 343 : 239,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: page == 'detail'
                    ? const EdgeInsets.symmetric(horizontal: 0)
                    : const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  // width: page == 'detail' ? 343 : 239,
                  height: page == 'detail' ? 197 : 137,
                  // Image radius
                  child: Image.network(youtubeModel.thumbnailUrl,
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: page == 'detail'
                  ? const EdgeInsets.symmetric(vertical: 4, horizontal: 0)
                  : const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    youtubeModel.authorName,
                    style: TextStyles.pretendardN13Gray60,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    text: TextSpan(
                        text: youtubeModel.title,
                        style: TextStyles.pretendardN13Gray90),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
