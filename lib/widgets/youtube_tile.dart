import 'package:flutter/material.dart';
import 'package:valt/model/youtube_model.dart';
import 'package:valt/styles/text_style.dart';

class YoutubeTile extends StatelessWidget {
  final YoutubeModel youtubeModel;
  const YoutubeTile({super.key, required this.youtubeModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 239,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 239,
                height: 137,
                child: Image.network(youtubeModel.thumbnailUrl)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    youtubeModel.authorName,
                    style: TextStyles.pretendardN13Gray60,
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
