import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/filter/price_range_item.dart';

class PriceRangeList extends StatelessWidget {
  const PriceRangeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '금액대 별',
            style: TextStyles.pretendardB18Gray100,
          ),
          SizedBox(height: 16),
          PriceRangeItem(
            name: '5만원 이하',
            maxPrice: 50000,
            minPrice: 0,
          ),
          PriceRangeItem(
            name: '5 ~ 10만원',
            maxPrice: 100000,
            minPrice: 50000,
          ),
          PriceRangeItem(name: '10 ~ 20만원', maxPrice: 200000, minPrice: 100000),
          PriceRangeItem(name: '20 ~ 30만원', maxPrice: 300000, minPrice: 200000),
          PriceRangeItem(name: '30만원 이상', maxPrice: 300000),
        ],
      ),
    );
  }
}
