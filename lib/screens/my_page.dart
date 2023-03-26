import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';
import 'package:valt/widgets/mypage/tab.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorStyles.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _memberId != null ? '누구누구님 안녕' : '로그인이 필요해요',
                        style: TextStyles.pretendardB18Gray100,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        _memberId != null
                            ? '누구누구님 안녕'
                            : '3초만에 로그인하고 다양한 서비스를 이용해보세요',
                        style: TextStyles.pretendardN12Gray60w500,
                      ),
                    ],
                  ),
                  if (_memberId == null)
                    IconButton(
                        onPressed: () => Get.to(AuthFirstPage()),
                        icon: const Icon(
                          Icons.chevron_right_sharp,
                          size: 31,
                          color: ColorStyles.gray50,
                        ))
                ],
              ),
            ),
            const SizedBox(height: 8),
            // if (_memberId != null)
            MyPageTab(title: '회원정보', tabItems: [
              TabItem('회원정보 수정', () {}),
              TabItem('비밀번호 변경', () {}),
            ]),
            MyPageTab(title: '고객센터', tabItems: [
              TabItem('문의하기', () async {
                if (await canLaunchUrl(
                    Uri.parse('https://forms.gle/JWLC13RgJhtYx5tw5'))) {
                  await launchUrl(
                      Uri.parse('https://forms.gle/JWLC13RgJhtYx5tw5'),
                      mode: LaunchMode.externalApplication);
                }
              }),
              TabItem('자주 묻는 질문', () {}),
              TabItem('상품 제안하기', () async {
                if (await canLaunchUrl(
                    Uri.parse('https://forms.gle/tqmtv2j17jMWot838'))) {
                  await launchUrl(
                      Uri.parse('https://forms.gle/tqmtv2j17jMWot838'),
                      mode: LaunchMode.externalApplication);
                }
              })
            ]),
            MyPageTab(title: '기타', tabItems: [
              TabItem('로그아웃', () {
                NetWorkHandler.deleteMemberId();
              }),
            ])
          ],
        ),
      ),
    );
  }
}
