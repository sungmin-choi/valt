import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/filter/country_item.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '국가별',
            style: TextStyles.pretendardB18Gray100,
          ),
          SizedBox(height: 16),
          CountryItem(
              name: '스코틀랜드',
              englishName: 'Scotland',
              imgUrl: 'assets/images/Scotland.png'),
          CountryItem(
              name: '아일랜드',
              englishName: 'Ireland',
              imgUrl: 'assets/images/Ireland.png'),
          CountryItem(
              name: '미국',
              englishName: 'America',
              imgUrl: 'assets/images/America.png'),
          CountryItem(
              name: '캐나다',
              englishName: 'Canada',
              imgUrl: 'assets/images/Canada.png'),
          CountryItem(
              name: '한국',
              englishName: 'Korea',
              imgUrl: 'assets/images/Korea.png'),
          CountryItem(
              name: '일본',
              englishName: 'Japan',
              imgUrl: 'assets/images/Japan.png'),
          CountryItem(
              name: '대만',
              englishName: 'Taiwan',
              imgUrl: 'assets/images/Taiwan.png'),
          CountryItem(
              name: '인도',
              englishName: 'India',
              imgUrl: 'assets/images/India.png')
        ],
      ),
    );
  }
}
