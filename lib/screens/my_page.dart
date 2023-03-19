import 'package:flutter/material.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var _memberId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetWorkHandler.getMemberId().then((value) => {
          setState(
            () {
              _memberId = value;
            },
          ),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.gray20,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('마이페이지', style: TextStyles.pretendardB17Gray100),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: ColorStyles.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    if (_memberId == null) ...[
                      const Text(
                        '로그인이 필요해요',
                        style: TextStyles.pretendardB18Gray100,
                      )
                    ] else ...[
                      Text(_memberId.toString()),
                    ],
                    const SizedBox(
                      height: 4,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
