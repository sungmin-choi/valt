import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:valt/controller/auth/kakao_login.dart';

class MainViewModel {
  final KakaoLogin _kakaoLogin;
  bool isLogined = false;
  User? kakaoUser;

  MainViewModel(this._kakaoLogin);

  Future kakaologin() async {
    isLogined = await _kakaoLogin.login();
    if (isLogined) {
      kakaoUser = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _kakaoLogin.logout();
    isLogined = false;
    kakaoUser = null;
  }
}
