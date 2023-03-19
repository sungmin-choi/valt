import 'package:flutter/material.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/dibs/login_induce.dart';
import 'package:get/get.dart';

class DibsPage extends StatefulWidget {
  const DibsPage({super.key});

  @override
  State<DibsPage> createState() => _DibsPageState();
}

class _DibsPageState extends State<DibsPage> {
  var controller = Get.find<ProductController>();

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
          // if (value != null)
          //   {
          //     controller
          //         .fetchDibsProductList()
          //         .then((value) => print('dibs: $value'))
          //   }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('찜한 상품', style: TextStyles.pretendardB17Gray100),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (_memberId == null) ...[
              LoginInduce(),
            ] else ...[
              Text(_memberId.toString()),
            ]
            //   if (_memberId == null) [
            //     LoginInduce()],
            //   else
            //     Text('ddddd'),

            // ],
          ])),
    );
  }
}
