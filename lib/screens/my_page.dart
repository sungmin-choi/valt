import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/model/user_data.dart';
import 'package:valt/screens/qna_page.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/service/network_handler/user_service.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';
import 'package:valt/widgets/mypage/logout_buttom_modal.dart';
import 'package:valt/widgets/mypage/tab.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var _memberId;

  UserData? userData;
  bool isLoading = true;
  bool toggle = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchUserData();

    // NetWorkHandler.getMemberId().then((value) => {
    //       setState(
    //         () {
    //           _memberId = value;
    //         },
    //       ),
    //     });
  }

  Future<void> _fetchUserData() async {
    setState(() {
      isLoading = true;
    });
    var memberId = await NetWorkHandler.getMemberId();
    if (memberId != null) {
      UserData? data = await UserServices.fetchUserData(memberId);
      if (data != null) {
        print(userDataToJson(data));
        setState(() {
          userData = data;
          toggle = data.isPromotionReceiveAgree;
          _memberId = memberId;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.gray20,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        titleSpacing: 0.0,
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
                        userData != null ? userData!.name : '로그인이 필요해요',
                        style: TextStyles.pretendardB18Gray100,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        userData != null
                            ? userData!.email
                            : '3초만에 로그인하고 다양한 서비스를 이용해보세요',
                        style: TextStyles.pretendardN12Gray60w500,
                      ),
                    ],
                  ),
                  if (userData == null)
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
            if (userData != null) ...[
              const SizedBox(height: 8),
              Container(
                height: 116,
                width: double.infinity,
                color: ColorStyles.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            top: 14, left: 16, bottom: 10, right: 16),
                        child: Text(
                          '알림 설정',
                          style: TextStyles.pretendardN12Gray60w500,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '마케팅 알림',
                                  style: TextStyles.pretendardN15Gray100,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  userData != null
                                      ? '마케팅 정보 수신 동의 ${userData!.promotionReceiveDate.toString().substring(0, 10)}'
                                      : '',
                                  style: TextStyles.pretendardN13Gray70,
                                )
                              ],
                            ),
                            CupertinoSwitch(
                              // overrides the default green color of the track
                              activeColor: ColorStyles.gray90,
                              // color of the round icon, which moves from right to left
                              thumbColor: ColorStyles.white,
                              // when the switch is off
                              trackColor: Colors.black12,
                              // boolean variable value
                              value: toggle,
                              // changes the state of the switch
                              onChanged: (value) async {
                                var res =
                                    await UserServices.fetchPromotionReceive(
                                        value, _memberId.toString());
                                if (res) {
                                  setState(() => toggle = value);
                                }
                                //
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 8),
            if (userData != null)
              MyPageTab(title: '회원정보', tabItems: [
                TabItem('회원정보 수정', () {
                  Get.toNamed('/edit_profile', arguments: {
                    'memberId': _memberId,
                    'name': userData!.name,
                    'gender': userData!.gender,
                    'birthDate': userData!.birth.toString(),
                    'whereListSelected': userData!.recommendType,
                    "platform": userData!.socialJoinType.toString(),
                    'reason': userData!.joinReason
                  });
                }),
                TabItem('비밀번호 변경', () {
                  Get.toNamed('/edit_password', arguments: {
                    'memberId': _memberId,
                  });
                }),
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
              TabItem('자주 묻는 질문', () {
                Get.to(() => const QNAPage());
              }),
              TabItem('상품 제안하기', () async {
                if (await canLaunchUrl(
                    Uri.parse('https://forms.gle/tqmtv2j17jMWot838'))) {
                  await launchUrl(
                      Uri.parse('https://forms.gle/tqmtv2j17jMWot838'),
                      mode: LaunchMode.externalApplication);
                }
              })
            ]),
            if (userData != null)
              MyPageTab(title: '기타', tabItems: [
                TabItem('로그아웃', () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return LogoutBottomModal(
                          handelLogout: () async {
                            var res = await UserServices.logout(_memberId);
                            if (res) {
                              NetWorkHandler.deleteMemberId();

                              setState(() {
                                userData = null;
                              });
                              Fluttertoast.showToast(
                                  msg: "로그아웃되었습니다",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.9),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.pop(context);
                            }
                          },
                        );
                      });

                  // NetWorkHandler.deleteMemberId();
                }),
              ])
          ],
        ),
      ),
    );
  }
}
