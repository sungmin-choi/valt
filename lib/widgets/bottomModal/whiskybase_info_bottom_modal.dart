import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class WhiskybaseInfoBottomModal extends StatelessWidget {
  const WhiskybaseInfoBottomModal({super.key});

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
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(4, 6, 0, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('위스키 베이스', style: TextStyles.pretendardB18Gray100),
                IconButton(
                    iconSize: 30.0,
                    color: ColorStyles.gray60,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(
                children: const [
                  Image(
                      width: 72,
                      height: 72,
                      image: AssetImage('assets/images/whiskybase.png')),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Whiskey Base는 위스키 평점을 관리하는 글로벌 사이트에요',
                    style: TextStyles.pretendardN13Gray90,
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
