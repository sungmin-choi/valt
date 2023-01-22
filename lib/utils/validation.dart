class Validation {
  //이메일 포맷 검증
  String? validateEmail(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return '이메일 형식을 확인해 주세요';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}")
            .hasMatch(value)) {
      return '영문, 숫자, 특수문자 조합 8~20자 입력해 주세요';
    }
    return null;
  }

  String? validateBrithDate(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^19[2-9][0-9](0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1])")
            .hasMatch(value)) {
      return '형식에 맞춰서 입력해 주세요 ex)19990101';
    }
    return null;
  }

  String? confirmPassword(String? password, String? confirmPassword) {
    if (password != null && password.isNotEmpty) {
      if (confirmPassword != null && confirmPassword.isNotEmpty) {
        if (password != confirmPassword) {
          return '비밀번호가 일치하지 않습니다.';
        } else {
          return null;
        }
      }
    }
    return null;
  }
}
