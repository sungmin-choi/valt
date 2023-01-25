import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/agree_terms_all_check.dart';
import 'package:valt/widgets/agree_terms_check_list.dart';
import 'package:valt/widgets/button_lg_fill.dart';

class AgreeTermsBottomModal extends StatefulWidget {
  const AgreeTermsBottomModal({super.key, required this.onClick});

  final void Function() onClick;

  @override
  State<AgreeTermsBottomModal> createState() => _AgreeTermsBottomModalState();
}

class _AgreeTermsBottomModalState extends State<AgreeTermsBottomModal> {
  bool _isAllagree = false;
  bool _isBtnDisable = true;
  List agreeList = [];

  void handelAgreeAllTerms() {
    if (_isAllagree) {
      setState(() {
        agreeList = [];
        _isAllagree = false;
        _isBtnDisable = true;
      });
    } else {
      setState(() {
        agreeList = [1, 2, 3];
        _isAllagree = true;
        _isBtnDisable = false;
      });
    }
  }

  void handleAgreeTerm(int value) {
    if (agreeList.contains(value)) {
      agreeList.removeWhere((element) => element == value);
      setState(() {
        agreeList = agreeList;
      });
      if (_isAllagree == true) {
        setState(() {
          _isAllagree = false;
        });
      }
    } else {
      agreeList.add(value);
      setState(() {
        agreeList = agreeList;
      });
      if (agreeList.length == 3) {
        setState(() {
          _isAllagree = true;
        });
      }
    }
    if (agreeList.contains(1) && agreeList.contains(2)) {
      setState(() {
        _isBtnDisable = false;
      });
    } else {
      setState(() {
        _isBtnDisable = true;
      });
    }
  }

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
      height: 330,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(4, 6, 0, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('약관동의', style: TextStyles.pretendardB18Gray100),
                  IconButton(
                      iconSize: 30.0,
                      color: ColorStyles.gray60,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            Container(
              height: 56,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ColorStyles.gray30),
                  borderRadius: const BorderRadius.all(Radius.circular(2))),
              child: AgreeTermsAllCheck(
                label: '아래 약관 모두 동의합니다.',
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                value: _isAllagree,
                onChanged: (value) {
                  handelAgreeAllTerms();
                },
              ),
            ),
            const SizedBox(height: 10),
            AgreeTermsCheckList(
              label: '개인정보 수집 이용 약관 (필수)',
              value: agreeList.contains(1),
              onChanged: (value) {
                handleAgreeTerm(1);
              },
            ),
            AgreeTermsCheckList(
              label: '{서비스}약관 동의 (필수)',
              value: agreeList.contains(2),
              onChanged: (value) {
                handleAgreeTerm(2);
              },
            ),
            AgreeTermsCheckList(
              label: '광고성 정보 수신 동의 (선택)',
              value: agreeList.contains(3),
              onChanged: (value) {
                handleAgreeTerm(3);
              },
            ),
            const SizedBox(height: 16),
            ButtonLgFill(
              text: '가입완료',
              bgColor: _isBtnDisable ? ColorStyles.gray15 : ColorStyles.gray90,
              textStyle: _isBtnDisable
                  ? TextStyles.pretendardB16Gray50
                  : TextStyles.pretendardB16White,
              onClick: widget.onClick,
            )
          ],
        ),
      ),
    );
  }
}
