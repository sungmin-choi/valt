import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/sort_orderBy_list_item.dart';

class SortOrderByBottomModal extends StatelessWidget {
  const SortOrderByBottomModal(
      {super.key, required this.onChangeSort, required this.curOrderBy});

  final Function(String value) onChangeSort;
  final String curOrderBy;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 230,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(4, 6, 0, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('정렬', style: TextStyles.pretendardB18Gray100),
                IconButton(
                    iconSize: 30.0,
                    color: ColorStyles.gray60,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Center(
              child: Column(
                children: [
                  SortOrderByListItem(
                      text: '평점 높은 순',
                      handelClick: () {
                        onChangeSort('MOST');
                        Navigator.pop(context);
                      },
                      isActive: curOrderBy == 'MOST'),
                  SortOrderByListItem(
                      text: '가격 낮은 순',
                      handelClick: () {
                        onChangeSort('LOW_PRICE');
                        Navigator.pop(context);
                      },
                      isActive: curOrderBy == 'LOW_PRICE'),
                  SortOrderByListItem(
                      text: '가격 높은 순',
                      handelClick: () {
                        onChangeSort('HIGH_PRICE');
                        Navigator.pop(context);
                      },
                      isActive: curOrderBy == 'HIGH_PRICE')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
