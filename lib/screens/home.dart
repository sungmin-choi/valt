import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/register_controller.dart';
import 'package:valt/screens/auth/auth_first_page.dart';

class Home extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AuthFirstPage());
            },
            icon: const Icon(
              Icons.mode_edit_outline_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // GetX<RegisterController>(
              //   builder: (_) => Text('Hello valt ${controller.email.value}'),
              // ),
              // Obx(() => Text('Hello valt ${controller.password.value}')),
              Text('username: ${controller.name.value}'),
              Text('password: ${controller.password.value}'),
              Text('email: ${controller.email.value}'),
              Text('gender: ${controller.gender.value == 0 ? 'man' : 'woman'}'),
              Text('birthDate: ${controller.birthDate.value}'),
              Text(
                  'registerReasonListSelected: ${controller.registerReasonListSelected.join('')}'),
              Text(
                  'registerReasonListSelected: ${controller.whereListSelected.join('')}')
            ],
          ),
        ),
      ),
    );
  }
}
