import 'package:flutter/material.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/text_style.dart';

class RecentSearchsKeywords extends StatefulWidget {
  const RecentSearchsKeywords({super.key});

  @override
  State<RecentSearchsKeywords> createState() => _RecentSearchsKeywordsState();
}

class _RecentSearchsKeywordsState extends State<RecentSearchsKeywords> {
  late List<dynamic> keywords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetWorkHandler.getRecentSearchs().then((value) => {
          setState(
            () {
              if (value != null) {
                keywords = value;
              } else {
                keywords = [];
              }
            },
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '최근 검색어',
              style: TextStyles.pretendardR14Gray100W700,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                '전체 삭제',
                style: TextStyles.pretendardR13Gray70,
              ),
            )
          ],
        ),
        if (keywords.isNotEmpty)
          for (var i = 0; i < keywords.length; i++)
            Text(keywords[i].toString()),
      ],
    );
  }
}
