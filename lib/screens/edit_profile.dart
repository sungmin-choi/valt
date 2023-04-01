import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/main.dart';
import 'package:valt/service/network_handler/user_service.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/buttom_m.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_custom.dart';
import 'package:valt/widgets/label.dart';
import 'package:valt/widgets/labeled_checkbox.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController reason = TextEditingController();
  var gender;
  bool disabled = false;
  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  List whereList = ['레스토랑', '위스키바', '파티', '홈술', '선물용'];
  List whereListEnglish = ['RESTAURANT', 'WHISKEY', 'PARTY', 'HOME', 'GIFT'];
  List whereListSelected = [];
  List registerReasonList = [
    '위스키 종류를 알고 싶어요.',
    '위스키 배경 지식을 알고 싶어요.',
    '위스키 맛을 알고 싶어요.',
    '평균 가격을 알고 싶어요.',
    '사람들의 후기를 보고 싶어요.',
    '기타'
  ];
  List registerReasonListSelected = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = Get.arguments['name'];
    gender = Get.arguments['gender'];
    birthDate.text = Get.arguments['birthDate'];
    whereListSelected = Get.arguments['whereListSelected'];
    reason.text = Get.arguments['reason'];
    print(Get.arguments['gender']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.gray20,
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
        title: const Text('회원정보 수정', style: TextStyles.pretendardB17Gray100),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            onChanged: () {
              if (name.text.isNotEmpty && birthDate.text.isNotEmpty) {
                var valid = _formKey.currentState!.validate();
                if (!valid) {
                  handelDisabled(true);
                } else {
                  handelDisabled(false);
                }
              } else {
                handelDisabled(true);
              }
            },
            child: Column(
              children: [
                Container(
                  color: ColorStyles.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('프로필',
                              style: TextStyles.pretendardB20Black),
                          const SizedBox(height: 2),
                          const Text('계정을 찾기 위해 정확하게 적어주세요.',
                              style: TextStyles.pretendardR14Gray70),
                          const SizedBox(height: 20),
                          InputCustom(
                              controller: name,
                              hintText: '이름 입력',
                              label: '이름',
                              validator: ((value) {
                                if (value != null && value.isEmpty) {
                                  return "이름을 입력해 주세요";
                                }
                                return null;
                              })),
                          const SizedBox(height: 20),
                          const Label(label: '성별'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: ButtonM(
                                    text: '남',
                                    bgColor: gender == 'M'
                                        ? ColorStyles.gray90
                                        : ColorStyles.white,
                                    textStyle: gender == 'M'
                                        ? TextStyles.pretendardN14White
                                        : TextStyles.pretendardN14Gray90,
                                    onClick: () => {
                                          setState(() {
                                            gender = 'M';
                                          })
                                        }),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                fit: FlexFit.tight,
                                child: ButtonM(
                                    text: '여',
                                    bgColor: gender == 'F'
                                        ? ColorStyles.gray90
                                        : ColorStyles.white,
                                    textStyle: gender == 'F'
                                        ? TextStyles.pretendardN14White
                                        : TextStyles.pretendardN14Gray90,
                                    onClick: () => {
                                          setState(
                                            () {
                                              gender = 'F';
                                            },
                                          )
                                        }),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          InputCustom(
                              controller: birthDate,
                              hintText: 'ex) 19990101',
                              label: '생년월일',
                              validator: ((value) =>
                                  Validation().validateBrithDate(value))),
                          const SizedBox(height: 32),
                        ]),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: ColorStyles.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          const Text('취향 설정',
                              style: TextStyles.pretendardB20Black),
                          const SizedBox(height: 2),
                          const Text('취향에 맞는 위스키를 추천해드릴게요.',
                              style: TextStyles.pretendardR14Gray70),
                          const SizedBox(height: 32),
                          const Text('어디서 위스키를 가장 많이 즐기시나요?',
                              style: TextStyles.pretendardB16Black),
                          const SizedBox(height: 2),
                          const Text('최대 3개까지 선택할 수 있어요.',
                              style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          for (int i = 0; i < whereList.length; i++)
                            LabeledCheckbox(
                              label: whereList[i].toString(),
                              padding: const EdgeInsets.only(bottom: 10),
                              value: whereListSelected
                                  .contains(whereListEnglish[i]),
                              onChanged: ((value) {
                                if (!value) {
                                  whereListSelected.removeWhere(
                                      (ele) => ele == whereListEnglish[i]);
                                  setState(() {
                                    whereListSelected = whereListSelected;
                                  });
                                } else {
                                  whereListSelected.add(whereListEnglish[i]);
                                  setState(() {
                                    whereListSelected = whereListSelected;
                                  });
                                }
                              }),
                            ),
                          const SizedBox(height: 20),
                          const Text('가입하시는 이유를 알고 싶어요.',
                              style: TextStyles.pretendardB16Black),
                          // const SizedBox(height: 2),
                          // const Text('최대 3개까지 선택할 수 있어요.',
                          //     style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          // for (var item in registerReasonList)
                          //   LabeledCheckbox(
                          //     label: item.toString(),
                          //     padding: const EdgeInsets.only(bottom: 10),
                          //     value: registerReasonListSelected.contains(item),
                          //     onChanged: ((value) {
                          //       if (!value) {
                          //         registerReasonListSelected
                          //             .removeWhere((ele) => ele == item);
                          //       } else {
                          //         registerReasonListSelected.add(item);
                          //       }
                          //     }),
                          //   ),
                          TextFormField(
                            controller: reason,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                                hintText: "내용을 입력해 주세요",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: ColorStyles.gray30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: ColorStyles.gray90))),
                          ),
                          const SizedBox(height: 32),
                          ButtonLgFill(
                              text: '변경하기',
                              textStyle: disabled
                                  ? TextStyles.pretendardB16Gray50
                                  : TextStyles.pretendardB16White,
                              bgColor: disabled
                                  ? ColorStyles.gray15
                                  : ColorStyles.gray90,
                              onClick: disabled
                                  ? () => {}
                                  : () async {
                                      String result =
                                          await UserServices.fetchEditProfile(
                                              Get.arguments['memberId']
                                                  .toString(),
                                              reason.text,
                                              int.parse(birthDate.text),
                                              name.text,
                                              Get.arguments['platform'],
                                              gender,
                                              whereListSelected);
                                      if (result == 'true') {
                                        Fluttertoast.showToast(
                                            msg: "회원 정보를 변경하였습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.7),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Get.to(() => const MyApp());
                                        // Get.toNamed('/mypage');
                                        // Navigator.pop(context);
                                      } else if (result == 'false') {
                                        Fluttertoast.showToast(
                                            msg: "회원정보 변경 실패",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.7),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (result ==
                                          UserServices.error401message) {
                                        Fluttertoast.showToast(
                                            msg: result,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.7),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Get.to(() => AuthFirstPage());
                                        // var res = await UserServices.logout(Get
                                        //     .parameters['memberId']
                                        //     .toString());
                                        // print(res);
                                        // if (res) {
                                        //   NetWorkHandler.deleteMemberId();
                                        //   Get.to(() => AuthFirstPage());
                                        // }
                                      }
                                    }),
                          const SizedBox(height: 42),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
