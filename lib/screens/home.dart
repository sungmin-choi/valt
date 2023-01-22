import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/screens/auth/auth_first_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: const SafeArea(
        child: Center(
          child: Text('Hello Valt'),
        ),
      ),
    );
  }
}
