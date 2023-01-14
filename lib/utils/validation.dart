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
}
