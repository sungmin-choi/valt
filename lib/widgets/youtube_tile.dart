import 'package:flutter/material.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/model/youtube_model.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';

class YoutubeTile extends StatelessWidget {
  var controller = Get.find<YoutubeController>();

  final YoutubeModel youtubeModel;
  YoutubeTile({super.key, required this.youtubeModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.youtubeLaunchUrl(youtubeModel.youtubeLink);
      },
      child: SizedBox(
        width: 239,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: SizedBox(
                width: 239,
                height: 137,
                // Image radius
                child:
                    Image.network(youtubeModel.thumbnailUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
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
