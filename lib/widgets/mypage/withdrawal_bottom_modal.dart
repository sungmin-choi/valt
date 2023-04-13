import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/buttom_m.dart';

class WithdrawalBottomModal extends StatefulWidget {
  const WithdrawalBottomModal({super.key, required this.handelDeleteCount});
  final Function handelDeleteCount;
  @override
  State<WithdrawalBottomModal> createState() => _WithdrawalBottomModalState();
}

class _WithdrawalBottomModalState extends State<WithdrawalBottomModal> {
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
        height: 200,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(4, 6, 0, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('회원을 탈퇴하시겠어요?',
                        style: TextStyles.pretendardB18Gray100),
                    IconButton(
                        iconSize: 30.0,
                        color: ColorStyles.gray60,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 24, left: 4),
                child: Text(
                  '회원을 탈퇴하시면 계정 정보를 복구하실 수 없어요.',
                  style: TextStyles.pretendardN13Gray90,
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
                        text: '회원탈퇴',
                        textStyle: TextStyles.pretendardN14White,
                        onClick: () => widget.handelDeleteCount())),
              ])
            ],
          ),
        ));
  }
}
