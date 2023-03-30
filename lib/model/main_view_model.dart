import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:valt/auth/kakao_login.dart';

class MainViewModel {
  final KakaoLogin _kakaoLogin;
  bool isLogined = false;
  User? kakaoUser;

  MainViewModel(this._kakaoLogin);

  Future kakaologin() async {
    await _kakaoLogin.login();
    // if (isLogined) {
    //   kakaoUser = await UserApi.instance.me();
    //   print(kakaoUser);
    // }
  }

  Future logout() async {
    await _kakaoLogin.logout();
    isLogined = false;
    kakaoUser = null;
  }
}
