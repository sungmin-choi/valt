import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/qna_tile.dart';

class QNAPage extends StatelessWidget {
  const QNAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text('자주 묻는 질문', style: TextStyles.pretendardB17Gray100),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                QNATile(
                    question: 'Q. 발트의 평점은 믿을 만한가요?',
                    answer:
                        '평점은 사람마다 다를 수 있다는 점 알고 계시죠? 그래서 발트에서는 글로벌 평론 사이트와 발트의 평점을 동시에 볼 수 있어요. 정확한 정보를 위해 다른 사람의 시음노트와 리뷰도 참고해주세요:)'),
                QNATile(
                    question: 'Q. 발트에서 위스키를 구매할 수는 없나요?',
                    answer:
                        '안타깝지만 위스키를 판매하지는 않아요. 다만 여러분의 취향에 맞는 위스키를 찾을 수 있도록 도와드릴게요.'),
                QNATile(
                    question: 'Q. 시음노트와 리뷰는 다른 건가요?',
                    answer:
                        '네, 시음노트와 리뷰는 다른 기능이에요. 리뷰는 고객님들이 상품평에 글을 남기는 곳이지만, 시음노트는 나만의 감상평을 적는 노트에요. 시음노트를 나만 보게 할 수도 있고 사람들에게 보여줄 수도 있어요. 여러분의 멋진 시음노트를 적어보시면 어떨까요?'),
              ],
            ),
          ),
        ));
  }
}
