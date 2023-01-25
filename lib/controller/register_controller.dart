import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  List whereListSelected = [].obs;
  List registerReasonListSelected = [].obs;
  RxInt gender = 3.obs;
  RxString birthDate = ''.obs;
  RxString name = ''.obs;

  void submitEmailPassword(String? pemail, String? ppassword) {
    if (pemail != null && ppassword != null) {
      email.value = pemail;
      password.value = ppassword;
    }
    update();
  }

  void submitOnboardingData(String? pname, String? pbirthDate, int? pgender,
      List pwhereListSelected, List pregisterReasonListSelected) {
    if (pname != null && pbirthDate != null && pgender != null) {
      name.value = pname;
      birthDate.value = pbirthDate;
      whereListSelected.addAll(pwhereListSelected);
      registerReasonListSelected.addAll(pregisterReasonListSelected);
    }
    update();
  }
}
