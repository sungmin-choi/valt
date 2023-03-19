import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class MyPageTab extends StatelessWidget {
  const MyPageTab({super.key, required this.title, required this.tabItems});

  final String title;

  final List<TabItem> tabItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorStyles.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 14, left: 16, bottom: 10, right: 16),
                child: Text(
                  title,
                  style: TextStyles.pretendardN12Gray60w500,
                )),
            for (var i = 0; i < tabItems.length; i++)
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      tabItems[i].onTap();
                    },
                    child: Text(tabItems[i].label),
                  )),
          ],
        ));
  }
}

class TabItem {
  final Function onTap;
  final String label;

  TabItem(this.label, this.onTap);
}
