import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/buttom_m.dart';

class LogoutBottomModal extends StatefulWidget {
  const LogoutBottomModal({super.key, required this.handelLogout});

  final Function handelLogout;
  @override
  State<LogoutBottomModal> createState() => _LogoutBottomModalState();
}

class _LogoutBottomModalState extends State<LogoutBottomModal> {
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
        height: 148,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(4, 6, 0, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('로그아웃하시겠어요?',
                        style: TextStyles.pretendardB18Gray100),
                    IconButton(
                        iconSize: 30.0,
                        color: ColorStyles.gray60,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: ButtonM(
                        bgColor: ColorStyles.white,
                        text: '취소',
                        textStyle: TextStyles.pretendardN14Gray90,
                        onClick: () => Navigator.pop(context))),
                const SizedBox(width: 4),
                Flexible(
                    fit: FlexFit.tight,
                    child: ButtonM(
                        bgColor: ColorStyles.gray90,
                        text: '로그아웃',
                        textStyle: TextStyles.pretendardN14White,
                        onClick: () => widget.handelLogout())),
              ])
            ],
          ),
        ));
  }
}
