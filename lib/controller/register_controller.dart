import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void submitEmailPassword(String? email, String? password) {
    email = email;
    password = password;
  }
}
