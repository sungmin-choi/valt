import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/bottomModal/category_info_bottom_modal.dart';
import 'package:valt/widgets/filter/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '카테고리별',
            style: TextStyles.pretendardB18Gray100,
          ),
          SizedBox(height: 16),
          CategoryItem(
            name: '싱글몰트',
            category: 'SINGLE_MALT',
            englishName: 'Single Malt',
            imgUrl: 'assets/images/SingleMalt.png',
            bottomModal: CategoryInfoBottomModal(
                title: '싱글 몰트 위스키',
                infoText:
                    '싹을 틔운 곡물, 그중에서도 보통은 맥아(보리)를 원료로 한 위스키에요. 만들어지는 지역과 증류소에 따라 독특한 맛과 향, 개성을 가지고 있어 마시는 사람에 따라 호불호가 갈리기도 해요. '),
          ),
          CategoryItem(
            name: '블렌디드',
            englishName: 'Blended',
            category: 'BLENDED',
            imgUrl: 'assets/images/Blended.png',
            bottomModal: CategoryInfoBottomModal(
                title: '블렌디드 위스키',
                infoText:
                    '두 종류 이상의 위스키를 섞어서 만든거에요. 전세계적으로 가장 대중화되어 있어요. 조니 워커, 발렌타인, 시바스 리갈, 로얄 살루트 등이 모두 블렌디드 위스키에요.'),
          ),
          CategoryItem(
            name: '블렌디드 몰트',
            category: 'BLENDED_MALT',
            englishName: 'Blended Malt',
            imgUrl: 'assets/images/BlendedMalt.png',
            bottomModal: CategoryInfoBottomModal(
                title: '블렌디드 몰트 위스키',
                infoText:
                    '싱글 몰트(맥아를 원료로 만든 위스키)만을 블렌딩한 위스키에요. 블렌디드 위스키와는 다르게 블렌디드 몰트 위스키에는 그레인 위스키가 들어가지 않아요. '),
          ),
          CategoryItem(
            name: '버번',
            englishName: 'Bourbon',
            category: 'BOURBON',
            imgUrl: 'assets/images/Bourbon.png',
            bottomModal: CategoryInfoBottomModal(
                title: '버번 위스키',
                infoText:
                    '아메리칸 위스키의 한 종류에요. 옥수수가 51% 들어가고, 새 오크통 안 쪽을 불에 태워 숙성해요. 짐 빔, 메이커스 마크, 에반 윌리엄스, 와일드 터키 등이 있어요.'),
          )
        ],
      ),
    );
  }
}
