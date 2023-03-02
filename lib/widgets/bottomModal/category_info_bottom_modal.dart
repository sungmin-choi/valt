import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class CategoryInfoBottomModal extends StatelessWidget {
  const CategoryInfoBottomModal(
      {super.key, required this.title, required this.infoText});

  final String title;
  final String infoText;

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
                Text(title, style: TextStyles.pretendardB18Gray100),
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
            child: Text(infoText),
          )
        ]));
  }
}
