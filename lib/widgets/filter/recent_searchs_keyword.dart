import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valt/controller/search_keywords_controller.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/filter/recent_search_badge.dart';
import 'package:get/get.dart';

class RecentSearchsKeywords extends StatefulWidget {
  const RecentSearchsKeywords({super.key});

  @override
  State<RecentSearchsKeywords> createState() => _RecentSearchsKeywordsState();
}

class _RecentSearchsKeywordsState extends State<RecentSearchsKeywords> {
  late List<dynamic> keywords = [];
  var controller = Get.find<SearchKeywordsController>();
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
              onTap: () async {
                await NetWorkHandler.deleteRecentSearchs();
                setState(() {
                  keywords = [];
                });
                Fluttertoast.showToast(
                    msg: '최근 검색어가 전체 삭제되었습니다.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black.withOpacity(0.7),
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: const Text(
                '전체 삭제',
                style: TextStyles.pretendardR13Gray70,
              ),
            )
          ],
        ),
        if (keywords.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                for (var i = 0; i < keywords.length; i++) ...[
                  RecentSearchBadge(
                      text: keywords[i].toString(),
                      onClick: () {
                        controller.textController.text = keywords[i].toString();
                        controller.fetchProductList(
                            keywords[i].toString(), 'MOST');
                      }),
                  const SizedBox(width: 8)
                ]
              ],
            ),
          )
      ],
    );
  }
}
